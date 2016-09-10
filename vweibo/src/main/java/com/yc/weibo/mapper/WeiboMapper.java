package com.yc.weibo.mapper;

import java.util.Map;

public interface WeiboMapper {
	int insertWeibo(Map<String, Object> map);
	
	int updateWeiboLike(int wbid);
	int insertWhoLike(int uid,int wbid);
	
	
}
