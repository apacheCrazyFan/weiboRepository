package com.yc.weibo.service;

import java.util.Map;

public interface CommentService {
	boolean insertCommentDirect(Map<String,Object> map);
	
	int selectCurrCommentId();
	
	boolean insertCommentByComment(Map<String,Object> map);
	
	String selectUnameByCid(int cid);
}
