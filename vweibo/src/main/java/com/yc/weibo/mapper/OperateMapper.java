package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

public interface OperateMapper {
	int selectoperateId(Map<String,Object> map);
	
	int deleteOperate(int Operateid);
	
	List<Integer> selectIfavoriteWeiboId(int uid);
	
	int insertWhoLikeWeibo(Map<String,Object> map);  //点赞
	
	int insertCollectWeibo(Map<String,Object> map);  //收藏
	
	int insertTransmitWeibo(Map<String,Object> map); //转发
}
