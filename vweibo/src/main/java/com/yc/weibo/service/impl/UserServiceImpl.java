package com.yc.weibo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.mapper.UserMapper;
import com.yc.weibo.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public WeiBoUser login(WeiBoUser user) {
		return userMapper.login(user);
	}

	@Override
	public int register(WeiBoUser user) {
		return userMapper.register(user);
	}


}
