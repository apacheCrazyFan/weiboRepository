package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.WeiboTag;

public interface WeiboTagMapper {
	int del(Map<String, String> params);
	
	int update(Map<String,String> idAndName);
	
	int insert(String wTname);
	
	List<WeiboTag> findAll();
	
	List<WeiboTag> findByPage(Map<String,Integer> sizeAndNum);
}
