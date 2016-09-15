package com.yc.weibo.service;

import java.util.Map;

public interface OperateService {
	int selectoperateId(Map<String,Object> map);
	
	boolean deleteOperate(int wbid);
	
	boolean insertWhoLikeWeibo(Map<String, Object> params);  //点赞
	
	boolean insertCollectWeibo(Map<String,Object> map);  //收藏
}
