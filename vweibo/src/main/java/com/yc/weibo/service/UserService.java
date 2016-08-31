package com.yc.weibo.service;

import com.yc.weibo.entity.WeiBoUser;

public interface UserService {

	WeiBoUser login(WeiBoUser user);

	int register(WeiBoUser user);

}
