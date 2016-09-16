package com.yc.weibo.mapper;

import java.util.Map;

public interface OperateMapper {
	int selectoperateId(Map<String,Object> map);
	
	int deleteOperate(int Operateid);
	
	int insertWhoLikeWeibo(Map<String,Object> map);  //点赞
	
	int insertCollectWeibo(Map<String,Object> map);  //收藏
}
