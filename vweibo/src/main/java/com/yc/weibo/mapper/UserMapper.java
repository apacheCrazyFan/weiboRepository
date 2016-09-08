package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.entity.Weibo;

public interface UserMapper {
	public WeiBoUser login(WeiBoUser user);

	public int register(WeiBoUser user);

	public List<Object> findUserSomethingMessage(WeiBoUser user);
	
	public int updataUserPhoto(Map<String, String> paramMap);
	
	public WeiBoUser findInfoByWbuid(int WBUid);
	
	void saveChangeUserName(Map<String, String> paramMap);
	
	void changePassWord(Map<String, String> paramMap);

}
