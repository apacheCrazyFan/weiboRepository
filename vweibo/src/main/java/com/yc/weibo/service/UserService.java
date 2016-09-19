package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.WeiBoUser;

public interface UserService {

	WeiBoUser login(WeiBoUser user);

	int register(WeiBoUser user);

	List<Object> findUserSomethingMessag(WeiBoUser user);
	
	int updataUserPhoto(Map<String, String> paramMap);
	
	WeiBoUser findInfoByWbuid(int WBUid);
	
	void saveChangeUserName(Map<String, String> paramMap);
	
	void changePassWord(Map<String, String> paramMap);

	void savePersonInfo(Map<String, String> paramMap);
	
	void saveUserTag(Map<String, String> paramMap);

	void saveFindMe(Map<String, String> paramMap);

	WeiBoUser quickLoginByEmail(String userName);

	WeiBoUser quickLoginByPhone(String userName);
	
	boolean updateUserAccount(Map<String,Object> map);

	List<WeiBoUser> findMingRen();

	void guanzhu(Map<String, Object> params);
}
