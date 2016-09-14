package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Weibo;


public interface WeiboMapper {
	int insertWeibo(Map<String, Object> map);
	int selectCurrMaxWBid();
	int initWeibohelp(int currWBid);
	
	int updateaddWeiboLike(int wbid);
	int updateWeiminuWeiboboLike(int wbid);
	int insertWhoLike(Map<String,Integer> map);
	int selectAfterLike(int wbid);
	
	List<Map<String,Object>> seleteWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);  //浏览次数优先mybatis里面是sql非嵌套查询也非嵌套结果
	List<Map<String,Object>> selectWeiboOrderByWHgreateAccount(Map<String,Integer> map);	//点赞次数优先嵌套查询或者嵌套结果
	
	List<Map<String,Object>> selectWeiboOrderByWBdate(Map<String,Integer> map);
	Weibo findHotWeiBo();
}
