package com.yc.weibo.daoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.weibo.bean.Admin;
import com.yc.weibo.dao.AdminDao;
import com.yc.weibo.dao.DBHelper;

@Component
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private DBHelper dbhelper;
	
	@Override
	public Admin getAdmin(List<Object> params) {
		String sql = "select * from Admin where Aname=? and Apwd=?";
		
		List<Admin> admins= dbhelper.find(sql, params, Admin.class);
		if(admins != null && admins.size() > 0){
			
			return admins.get(0);
		}
		return null;
	}

}
