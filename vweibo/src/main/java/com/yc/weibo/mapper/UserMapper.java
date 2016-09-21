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

	void savePersonInfo(Map<String, String> paramMap);
	
	void saveUserTag(Map<String, String> paramMap);

	void saveFindMe(Map<String, String> paramMap);

	public WeiBoUser quickLoginByEmail(String Uemail);

	public WeiBoUser quickLoginByPhone(String Uphone);
	
	int updateUserAccount(Map<String, Object> map);

	public List<WeiBoUser> findMingRen();

	public void guanzhu(Map<String, Object> params);

	/**
	 * 查询用户
	 * @param map
	 * @return
	 */
	List<WeiBoUser> findAllUser(Map<String,Object> map);
	/**
	 * 删除用户
	 * @param wBUid
	 * @return
	 */
	int delUser(Map<String,Object> map);
	
	/**
	 * 通用的，查找用户的总数
	 */
	int countAlluser(WeiBoUser param);
}
