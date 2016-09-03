package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.WeiboTag;

public interface WeiboTagService {
	boolean delWeiboTag(String tids);
	
	boolean updateWeiboTag(Map<String,String> idAndName);
	
	boolean insertWeiboTag(String wTname);
	
	List<WeiboTag> findAllWeiboTag();
	
	List<WeiboTag> findWeiboTagByPage(Map<String,Integer> sizeAndNum);
}
