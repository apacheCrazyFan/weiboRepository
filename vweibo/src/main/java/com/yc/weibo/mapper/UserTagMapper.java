package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.UserTag;

public interface UserTagMapper {
	int del(Map<String, String> params);
	
	int update(Map<String,Object> idAndName);
	
	int insert(UserTag usertag);
	
	List<UserTag> findAll();
	
	List<UserTag> findByPage(Map<String,Integer> sizeAndNum);
}
