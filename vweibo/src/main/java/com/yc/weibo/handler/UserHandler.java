package com.yc.weibo.handler;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.weibo.entity.Theme;
import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.service.ThemeService;
import com.yc.weibo.service.UserService;

import sun.misc.BASE64Decoder;



@Controller
@RequestMapping("/user")
@SessionAttributes(value={"user","Themes","groupnumber"},types={String.class})
public class UserHandler {
	@Autowired
	private UserService userService;
	@Autowired
	private ThemeService themeService;


	//登录
	@ModelAttribute
	public void getModel(ModelMap map){ //使用map/modelMap进行数据传参，作用范围是？还是会话
		map.put("user", new WeiBoUser());
		map.put("Themes", new ArrayList<Theme>()); //话题信息
		map.put("groupnumber", new HashMap<String,Integer>()); //关注，粉丝。微博，未分组，好友圈等
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String UphoneOrUemail,String Upassword,ModelMap map){
		//System.out.println("===>>"+user); //登录时注入的用户

		WeiBoUser user = null;
		String format = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";
		
		if(UphoneOrUemail.matches(format)){ //说明是邮箱
			//System.out.println( "我进了邮箱");
			user = new WeiBoUser(Upassword,UphoneOrUemail,0);
		}else{
			//System.out.println( "我进了手机");
			user = new WeiBoUser(Upassword,UphoneOrUemail);
		}
		
		
		user=userService.login(user);
		System.out.println( "=============>"+user);
		if(user==null){
			map.put("errorMsg","用户名或密码错误");
			return "forward:/front/page/login.jsp";
		}
		//到这里说明登录成功了。那么我们作为服务器一端     应该要给它准备一些数据 ，还是它自己再做请求去申请数据？？
		Map<String,Integer> params = new HashMap<String,Integer>();
		params.put("pageSize", 10);
		params.put("pageNum", 1);
		List<Theme> Themes = themeService.findThemeByPage(params);
		
		List<Map<String, Integer>> groupnumber = themeService.findeGroupNumber(user.getWBUid());
		System.out.println("==========>"+groupnumber );
		map.put("user", user);		//用户信息
		map.put("Themes", Themes); //话题信息
		map.put("groupnumber", groupnumber.get(0)); //关注，粉丝。微博，未分组，好友圈等
		
		System.out.println("===========>"+ Themes);
		return "forward:/front/page/afterlogin.jsp";	
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
