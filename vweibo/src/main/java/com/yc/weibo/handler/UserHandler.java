package com.yc.weibo.handler;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import org.apache.catalina.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.service.UserService;

import sun.misc.BASE64Decoder;



@Controller
@RequestMapping("/user")
public class UserHandler {
	@Autowired
	private UserService userService;


	//登录
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(WeiBoUser user,ModelMap map,HttpSession session){
		System.out.println("===>>"+user);

		user=userService.login(user);
		if(user==null){
			map.put("errorMsg","用户名或密码错误");

			return "redirect:/front/page/login.jsp";
		}

		session.setAttribute("user", user);
		return "redirect:/front/page/afterlogin.jsp";	


	}

	//注册
	@RequestMapping(value="/register")
	public String register(@ModelAttribute("user")WeiBoUser user,ModelMap map,HttpServletRequest request){
		System.out.println("===>>"+user);
		Random random=new Random();
		StringBuffer randomCode = new StringBuffer();
		// 设置默认生成4个验证码
		int length = 4;
		// 设置备选验证码:包括"a-z"和数字"0-9"
		String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		int size = base.length();
		// 随机产生4位数字的验证码。
		for (int i = 0; i < length; i++) {
			// 得到随机产生的验证码数字。
			int start = random.nextInt(size);
			String strRand = base.substring(start, start + 1);
			// 将产生的四个随机数组合在一起。
			randomCode.append(strRand);
		}
		boolean isSendEmail=activeAccountMail("用户验证","您的验证码为:"+randomCode.toString(),
				"13237344042@163.com",user.getUemail());
		System.out.println(isSendEmail);
		if (isSendEmail) {
			if (randomCode.toString().equalsIgnoreCase(user.getYZcodeInput())) {
				userService.register(user);
				return "front/page/login.jsp";
			} else {
				map.put("YZcodeErr", "验证码错误,请重新获取");
				return "front/page/register.jsp";
			} 
		}else{
			map.put("YZcodeErr", "发送失败,请重新发送");
			return "front/page/register.jsp";
		}

	}
	//邮件发送
	@Autowired
	private JavaMailSender mailSender;
	private boolean activeAccountMail(String subject,String content,String from,String to){
		try {
			MimeMessage mm = mailSender.createMimeMessage();
			MimeMessageHelper mmh = new MimeMessageHelper(mm,true);
			mmh.setTo(to);  //设置邮件接收者
			mmh.setFrom(from); //
			mmh.setSubject(subject);   //设置主题
			mmh.setText(content);    //设置内容
			mailSender.send(mm);   //设置邮件
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}

	//上传头像
	@RequestMapping(value="setphoto",method=RequestMethod.POST)
	public String setPhoto(@RequestParam("photodata") String file,PrintWriter out){
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] bytes;
		try {
			bytes = decoder.decodeBuffer(file);
			for (int i = 0; i < bytes.length; ++i) {
				if (bytes[i] < 0) {
					bytes[i] += 256;
				}
			}
			String filename=new Date().getTime()+""+new Random().nextInt(100000)+".jpg";
			FileOutputStream photopath = new FileOutputStream("D:\\Tomcat-7.0.30\\webapps\\weiboimage\\"+filename);
			photopath.write(bytes); 
			
			out.println("头像上传成功");
		} catch (IOException e) {
			e.printStackTrace();
			out.println("头像上传失败");
		}
		
		return null;
	}



}
