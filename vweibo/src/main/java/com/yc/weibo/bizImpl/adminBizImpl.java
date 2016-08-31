package com.yc.weibo.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.bean.Admin;
import com.yc.weibo.biz.AdminBiz;
import com.yc.weibo.dao.AdminDao;

@Service("adminBiz")
public class adminBizImpl implements AdminBiz{
	@Autowired
	private AdminDao adminDao;
	@Override
	public boolean adminLogin(List<Object> params) {
		Admin admin = adminDao.getAdmin(params);
		return (admin == null) ? false : true;
	}

}
