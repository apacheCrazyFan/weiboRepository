package com.yc.weibo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yc.weibo.entity.Weibo;
import com.yc.weibo.mapper.WeiboMapper;
import com.yc.weibo.service.WeiboService;

@Controller("weiboService")
public class WeiboServiceImpl implements WeiboService{

	@Autowired
	private WeiboMapper weiboMapper;
	
	//插入微博
	@Override
	public boolean addWeibo(Map<String, Object> map) {
		return weiboMapper.insertWeibo(map) > 0 ? true : false;
	}
	@Override
	public int selectCurrMaxWBid() {
		return weiboMapper.selectCurrMaxWBid();
	}
	@Override
	public boolean initWeibohelp(int currWBid) {
		return weiboMapper.initWeibohelp(currWBid) > 0 ? true : false;
	}
	
	
	@Override
	public List<Map<String, Object>> findWeiboOrderByWHviewAccountFirst(Map<String, Integer> map) {
		return weiboMapper.seleteWeiboOrderByWHviewAccountFirst(map);
	}
	@Override
	public List<Map<String,Object>> findtWeiboOrderByWHgreateAccountFirst(Map<String, Integer> map) {
		return weiboMapper.selectWeiboOrderByWHgreateAccount(map);
	}
	
	
	@Override
	public List<Map<String, Object>> findWeiboOrderByWBdate(Map<String, Integer> map) {
		return weiboMapper.selectWeiboOrderByWBdate(map);
	}
	
	
	//点赞
	@Override
	public boolean updateaddWeiboLike(int wbid) {
		return weiboMapper.updateaddWeiboLike(wbid) > 0 ? true : false;
	}
	@Override
	public boolean insertWhoLike(Map<String,Integer> map) {
		return weiboMapper.insertWhoLike(map) > 0 ? true : false;
	}
	@Override
	public int selectAfterLikeGreateAcount(int wbid) {
		return weiboMapper.selectAfterLike(wbid);
	}
	@Override
	public boolean updateminuWeiboLike(int wbid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Map<String, Object>> findHotWeiBo(Map<String, Integer> map) {
		
		return weiboMapper.findHotWeiBo(map);
	}




}
