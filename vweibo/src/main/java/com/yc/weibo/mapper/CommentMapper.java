package com.yc.weibo.mapper;

import java.util.Map;

public interface CommentMapper {
	int insertCommentDirect(Map<String,Object> map);
	
	int selectCurrCommentId();
	
	int insertCommentByComment(Map<String,Object> map);
	
	String selectUnameByCid(int cid);
}
