package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.WeiBoUser;

public interface UserService {

	WeiBoUser login(WeiBoUser user);

	int register(WeiBoUser user);

	List<Object> findUserSomethingMessag(WeiBoUser user);
	
	public int updataUserPhoto(Map<String, String> paramMap);
}
