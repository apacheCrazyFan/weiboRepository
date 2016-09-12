package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Weibo;

public interface WeiboService {
	boolean addWeibo(Map<String, Object> map);
	
	List<Map<String,Object>> findWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);
	
	List<Weibo> findtWeiboOrderByWHgreateAccount(Map<String,Integer> map);
}
