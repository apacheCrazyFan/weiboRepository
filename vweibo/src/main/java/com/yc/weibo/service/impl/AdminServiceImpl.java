package com.yc.weibo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.entity.Admin;
import com.yc.weibo.mapper.AdminMapper;
import com.yc.weibo.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public boolean login(Admin admin) {
		return adminMapper.login(admin) > 0 ? true : false;
	}

}
