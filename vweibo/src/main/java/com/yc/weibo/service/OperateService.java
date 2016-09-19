package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

public interface OperateService {
	int selectoperateId(Map<String,Object> map);
	
	boolean deleteOperate(int wbid);
	
	List<Integer> selectIfavoriteWeiboId(int uid);
	
	boolean insertWhoLikeWeibo(Map<String, Object> params);  //点赞
	
	boolean insertCollectWeibo(Map<String,Object> map);  //收藏
	
	boolean insertTransmitWeibo(Map<String,Object> map);    //转发
	
	boolean insertCommentWeibo(Map<String,Object> map); //评论
}
