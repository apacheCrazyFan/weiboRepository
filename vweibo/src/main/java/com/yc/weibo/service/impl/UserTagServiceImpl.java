package com.yc.weibo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yc.weibo.entity.Theme;
import com.yc.weibo.entity.UserTag;
import com.yc.weibo.mapper.UserTagMapper;
import com.yc.weibo.service.UserTagService;

@Controller("userTagService")
public class UserTagServiceImpl implements UserTagService {
	@Autowired
	private UserTagMapper userTagMapper;
	
	/**
	 * 更新用户标签
	 */
	@Override
	public boolean updateUserTag(Map<String,Object> idAndName) {
		return userTagMapper.update(idAndName) > 0 ? true : false;
	}

	/**
	 * 插入用户标签
	 */
	@Override
	public int addUserTag(UserTag usertag) {
		return userTagMapper.insert(usertag);
	}

	/**
	 * 无条件查询所有的用户标签
	 */
	@Override
	public List<UserTag> findAllUserTag() {
		return userTagMapper.findAll();
	}

	/**
	 * 分页查询用户标签
	 */
	@Override
	public List<UserTag> findUserTagByPage(Map<String,Integer> sizeAndNum) {
		return userTagMapper.findByPage(sizeAndNum);
	}

	/**
	 * 删除用户标签
	 */
	@Override
	public boolean delUserTag(String utids) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("ids", utids);
		return userTagMapper.del(params) > 0 ? true : false;
	}

}
