package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.entity.Weibo;


public interface WeiboService {
	boolean addWeibo(Map<String, Object> map);
	int selectCurrMaxWBid();
	boolean initWeibohelp(int currWBid);
	
	boolean updateViewOnly(int wbid);
	
	int selectWBUidByWbid(int wbid);
	
	boolean updateaddWeiboLike(int wbid);
	boolean updateminuWeiboLike(int wbid);
	int selectAfterLikeGreateAcount(int wbid);
	
	boolean updateCollectionAccount(int wbid);
	int selectAfterCollection(int wbid);
	
	String selectTransmityon(int wbid);
	List<Map<String,Object>> selectWeiboandweiboHelpById(int wbid);
	boolean insertWeiboByTransmit(Map<String,Object> map);
	boolean updateTransmitAccount(int wbid);
	
	boolean updateCommentAccount(int wbid);
	int selectAfterComment(int wbid);
	
	
	List<Map<String,Object>> findWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findtWeiboOrderByWHgreateAccountFirst(Map<String,Integer> map);
	
	List<Map<String,Object>> findWeiboOrderByWBdate(Map<String,Integer> map);
	List<Map<String,Object>> selectWeiboOrderByWBdateAndIsVideo(Map<String,Integer> map);
	List<Map<String,Object>> selectWeiboOrderByWBdateAndIsMusic(Map<String,Integer> map);
	List<Map<String,Object>> selectWeiboOrderByWBdateAndIsPicture(Map<String,Integer> map);
	
	List<Map<String,Object>> selectWeiboByLike(Map<String,Object> map);
	
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

	List<Weibo> findMyZan(int wBUid);
	List<Map<String, Object>> findWeiBoByWBtag(Map<String, Object> params);
	List<Weibo> findpersonal(int wBUid);
	List<Map<String, Object>> findGroupWeiBo(Map<String, Integer> params);
	List<Map<String, Object>> findMoreAttentionWeiBo(Map<String, Integer> params);
	List<Weibo> findMyPhoto(Integer wBUid);
	List<WeiBoUser> findMyFans(Integer wBUid);
}
