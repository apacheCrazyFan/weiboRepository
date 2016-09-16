package com.yc.weibo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.mapper.OperateMapper;
import com.yc.weibo.service.OperateService;

@Service("operateService")
public class OperateServiceImpl implements OperateService{
	@Autowired
	private OperateMapper operateMapper;
	
	@Override
	public int selectoperateId(Map<String, Object> map) {
		return operateMapper.selectoperateId(map);
	}
	@Override
	public boolean deleteOperate(int wbid) {
		return operateMapper.deleteOperate(wbid) > 0 ? true : false;
	}
	@Override
	public List<Integer> selectIfavoriteWeiboId(int uid) {
		return operateMapper.selectIfavoriteWeiboId(uid);
	}
	//点赞 插入操作表
	@Override
	public boolean insertWhoLikeWeibo(Map<String, Object> map) {
		return operateMapper.insertWhoLikeWeibo(map) > 0 ? true : false;
	}
	//收藏 插入操作表
	@Override
	public boolean insertCollectWeibo(Map<String, Object> map) {
		return operateMapper.insertCollectWeibo(map) > 0 ? true : false;
	}

}
