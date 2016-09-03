package com.yc.weibo.service;

import java.util.List;
import com.yc.weibo.entity.WeiBoUser;

public interface UserService {

	WeiBoUser login(WeiBoUser user);

	int register(WeiBoUser user);

	List<Object> findUserSomethingMessag(WeiBoUser user);
}
