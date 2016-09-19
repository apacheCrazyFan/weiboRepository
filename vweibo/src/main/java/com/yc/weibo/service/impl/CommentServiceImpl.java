package com.yc.weibo.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yc.weibo.mapper.CommentMapper;
import com.yc.weibo.service.CommentService;

@Controller("commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public boolean insertCommentDirect(Map<String, Object> map) {
		return commentMapper.insertCommentDirect(map) > 0 ? true : false;
	}

	@Override
	public int selectCurrCommentId() {
		return commentMapper.selectCurrCommentId();
	}

	@Override
	public boolean insertCommentByComment(Map<String, Object> map) {
		return commentMapper.insertCommentByComment(map) > 0 ? true : false;
	}

	@Override
	public String selectUnameByCid(int cid) {
		return commentMapper.selectUnameByCid(cid);
	}

}
