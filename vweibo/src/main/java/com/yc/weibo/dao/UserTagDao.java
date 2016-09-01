package com.yc.weibo.dao;

import java.util.List;

import com.yc.weibo.bean.UserTag;


public interface UserTagDao {
	List<UserTag> findAllUserTags();

	int delUserTag(String tids);

	int addUserTag(String UTname);

	int updateUserTag(Integer valueOf, String uTname);
}
