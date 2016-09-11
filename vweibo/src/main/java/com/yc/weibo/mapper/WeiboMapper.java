package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Weibo;

public interface WeiboMapper {
	int insertWeibo(Map<String, Object> map);
	
	int updateWeiboLike(int wbid);
	int insertWhoLike(int uid,int wbid);
	
	List<Weibo> seleteWeiboOrderByWHviewAccountFirst();  //浏览次数优先
	List<Weibo> selectWeiboOrderByWHgreateAccount();	//点赞次数优先
}
