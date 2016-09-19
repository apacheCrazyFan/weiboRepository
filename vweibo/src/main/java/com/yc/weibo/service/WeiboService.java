package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Weibo;


public interface WeiboService {
	boolean addWeibo(Map<String, Object> map);
	int selectCurrMaxWBid();
	boolean initWeibohelp(int currWBid);
	
	boolean updateaddWeiboLike(int wbid);
	boolean updateminuWeiboLike(int wbid);
	int selectAfterLikeGreateAcount(int wbid);
	
	boolean updateCollectionAccount(int wbid);
	int selectAfterCollection(int wbid);
	
	List<Map<String,Object>> findWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findtWeiboOrderByWHgreateAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findWeiboOrderByWBdate(Map<String,Integer> map);
	List<Map<String, Object>> findHotWeiBo(Map<String,Integer> map);
	List<Map<String, Object>> findFriendWeiBo(Map<String, Integer> params);
	List<Weibo> myCollections(int wBUid);
	
	/**
	 * 根据话题id，查找对应的微博列表
	 * @author zd
	 * @date 2016-9-17
	 * @param tid
	 * @return
	 */
	public List<Weibo> findWeiBoByTid(int tid);
	
	/**
	 * 计算话题下微博的总数
	 */
	int WBTfindCount(Map<String,Object> map);
	
	/**
	 * 根据页数查询微博
	 * @param map
	 * @return
	 */
	List<Weibo> findWeiboByPage(Map<String, Object> params);
}
