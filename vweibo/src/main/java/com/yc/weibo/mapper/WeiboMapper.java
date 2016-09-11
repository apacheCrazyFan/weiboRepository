package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Weibo;

public interface WeiboMapper {
	int insertWeibo(Map<String, Object> map);
	
	int updateWeiboLike(int wbid);
	int insertWhoLike(int uid,int wbid);
	
	List<Map<String,Object>> seleteWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);  //浏览次数优先mybatis里面是sql非嵌套查询也非嵌套结果
	List<Weibo> selectWeiboOrderByWHgreateAccount(Map<String,Integer> map);	//点赞次数优先嵌套查询或者嵌套结果
}
