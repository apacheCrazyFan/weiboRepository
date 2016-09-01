package com.yc.weibo.biz;

import java.util.List;

import com.yc.weibo.bean.UserTag;


public interface UserTagBiz {
	List<UserTag> findAllUserTags();

	boolean delUserTag(String tids);

	boolean addUserTag(String UTname);

	boolean updateUserTag(Integer valueOf, String uTname);
}
