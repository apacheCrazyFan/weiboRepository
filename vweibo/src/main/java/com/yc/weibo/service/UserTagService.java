package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.UserTag;

public interface UserTagService {
	boolean delUserTag(String utids);
	
	boolean updateUserTag(Map<String,Object> idAndName);
	
	int addUserTag(UserTag usertag);
	
	List<UserTag> findAllUserTag();
	
	List<UserTag> findUserTagByPage(Map<String,Integer> sizeAndNum);
}
