package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Weibo;


public interface WeiboMapper {
	
	int insertWeibo(Map<String, Object> map);
	int selectCurrMaxWBid();
	int initWeibohelp(int currWBid);
	
	int updateViewOnly(int wbid);
	
	int selectWBUidByWbid(int wbid);
	
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
	
	int updateCommentAccount(int wbid); //更新评论后的weiboHelp
	int selectAfterComment(int wbid); //查出更新评论后的评论数
	
	List<Map<String,Object>> seleteWeiboOrderByWHviewAccountFirst(Map<String,Integer> map);  //浏览次数优先mybatis里面是sql非嵌套查询也非嵌套结果
	List<Map<String,Object>> selectWeiboOrderByWHgreateAccount(Map<String,Integer> map);	//点赞次数优先嵌套查询或者嵌套结果
	
	List<Map<String,Object>> selectWeiboOrderByWBdate(Map<String,Integer> map);
	
	List<Map<String, Object>> findHotWeiBo(Map<String, Integer> map);
	
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
	int WBTfindCount(Map<String,Object > map);
	
	/**
	 * 根据页数查询微博
	 * @param map
	 * @return
	 */
	List<Weibo> findWeiboByPage(Map<String,Object> map);

	List<Weibo> findMyZan(int wBUid);
	
	List<Map<String, Object>> findWeiBoByWBtag(Map<String, Object> params);
	
	List<Weibo> findpersonal(int WBUid);
	
	List<Map<String, Object>> findGroupWeiBo(Map<String, Integer> params);
	
	List<Map<String, Object>> findMoreAttentionWeiBo(Map<String, Integer> params);
	
	List<Weibo> findMyPhoto(Integer wBUid);
}
