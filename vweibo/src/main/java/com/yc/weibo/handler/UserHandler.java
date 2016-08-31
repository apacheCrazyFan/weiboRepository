package com.yc.weibo.handler;



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

import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.service.UserService;

@Controller
@RequestMapping("/user")
public class UserHandler {
	@Autowired
	private UserService userService;


	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(WeiBoUser user,ModelMap map){
		System.out.println("===>>"+user);

		user=userService.login(user);
		if(user==null){
			return "login";
		}
		map.put("errorMsg","用户名或密码错误");
		return "afterlogin";	

	}

	
	


}
