package com.yc.weibo.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yc.weibo.bean.UserTag;
import com.yc.weibo.biz.UserTagBiz;
import com.yc.weibo.dao.UserTagDao;


public class UserTagBizImpl implements UserTagBiz{
	@Autowired
	private UserTagDao dao;
	
	@Override
	public List<UserTag> findAllUserTags() {
		return dao.findAllUserTags();
	}
	@Override
	public boolean delUserTag(String tids) {
		return dao.delUserTag(tids) > 0  ? true : false;
	}
	@Override
	public boolean addUserTag(String UTname) {
		return dao.addUserTag(UTname) > 0 ? true : false;
	}
	@Override
	public boolean updateUserTag(Integer valueOf, String uTname) {
		return dao.updateUserTag(valueOf,uTname) > 0 ? true : false;
	}

}
