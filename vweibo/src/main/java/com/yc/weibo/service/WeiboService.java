package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Weibo;


public interface WeiboService {
	boolean addWeibo(Map<String, Object> map);
	int selectCurrMaxWBid();
	boolean initWeibohelp(int currWBid);
	
	boolean updateViewOnly(int wbid);
	
	boolean updateaddWeiboLike(int wbid);
	boolean updateminuWeiboLike(int wbid);
	int selectAfterLikeGreateAcount(int wbid);
	
	boolean updateCollectionAccount(int wbid);
	int selectAfterCollection(int wbid);
	
	String selectTransmityon(int wbid);
	List<Map<String,Object>> selectWeiboandweiboHelpById(int wbid);
	boolean insertWeiboByTransmit(Map<String,Object> map);
	boolean updateTransmitAccount(int wbid);
	
	List<Map<String,Object>> findWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findtWeiboOrderByWHgreateAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findWeiboOrderByWBdate(Map<String,Integer> map);
	List<Map<String, Object>> findHotWeiBo(Map<String,Integer> map);
	List<Map<String, Object>> findFriendWeiBo(Map<String, Integer> params);
	List<Weibo> myCollections(int wBUid);
	List<Weibo> findMyZan(int wBUid);
	List<Map<String, Object>> findWeiBoByWBtag(Map<String, Object> params);
}
