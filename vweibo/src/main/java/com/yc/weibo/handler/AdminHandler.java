package com.yc.weibo.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yc.weibo.entity.Admin;
import com.yc.weibo.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminHandler {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Admin admin){
		if(adminService.login(admin)){
			return "redirect:/back/manager/index.html";
		}
		return "redirect:/back/manager/login.html";
	}
}
