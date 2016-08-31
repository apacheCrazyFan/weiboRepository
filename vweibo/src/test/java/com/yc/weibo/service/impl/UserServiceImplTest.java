package com.yc.weibo.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class UserServiceImplTest {
	@Autowired
	private UserService userService;
	@Test
	public void testLogin() {
		System.out.println(userService.login(new WeiBoUser("pqb","a")));
	}

}
