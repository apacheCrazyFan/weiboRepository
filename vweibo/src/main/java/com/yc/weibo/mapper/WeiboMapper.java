package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Weibo;


public interface WeiboMapper {
	
	int insertWeibo(Map<String, Object> map);
	int selectCurrMaxWBid();
	int initWeibohelp(int currWBid);
	
	int updateViewOnly(int wbid);
	
	int selectOperateId(Map<String,Integer> map);
	
	int updateaddWeiboLike(int wbid);
	int updateminuWeiboLike(int wbid);
	int selectAfterLike(int wbid);
	
	int updateCollectionAccount(int wbid);
	int selectAfterCollection(int wbid);
	
	String selectTransmityon(int wbid);  //查是否是转发微博   N/Y
	List<Map<String,Object>> selectWeiboandweiboHelpById(int wbid); //根据id查weibo和weibohelp表
	int insertWeiboByTransmit(Map<String, Object> map);  //插入转发微博
	int updateTransmitAccount(int wbid);
	
	
	List<Map<String,Object>> seleteWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);  //浏览次数优先mybatis里面是sql非嵌套查询也非嵌套结果
	List<Map<String,Object>> selectWeiboOrderByWHgreateAccount(Map<String,Integer> map);	//点赞次数优先嵌套查询或者嵌套结果
	
	List<Map<String,Object>> selectWeiboOrderByWBdate(Map<String,Integer> map);
	
	List<Map<String, Object>> findHotWeiBo(Map<String, Integer> map);
	
	List<Map<String, Object>> findFriendWeiBo(Map<String, Integer> params);
	
	List<Weibo> myCollections(int wBUid);
	
	List<Weibo> findMyZan(int wBUid);
	
	List<Map<String, Object>> findWeiBoByWBtag(Map<String, Object> params);
	
	List<Weibo> findpersonal(int WBUid);
	
	List<Map<String, Object>> findGroupWeiBo(Map<String, Integer> params);
	
	List<Map<String, Object>> findMoreAttentionWeiBo(Map<String, Integer> params);
}
