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
	@Override
	public boolean addWeibo(Map<String, Object> map) {
		return weiboMapper.insertWeibo(map) > 0 ? true : false;
	}
	@Override
	public List<Map<String, Object>> findWeiboOrderByWHviewAccountFirst(Map<String, Integer> map) {
		return weiboMapper.seleteWeiboOrderByWHviewAccountFirst(map);
	}
	@Override
	public List<Weibo> findtWeiboOrderByWHgreateAccount(Map<String, Integer> map) {
		return weiboMapper.selectWeiboOrderByWHgreateAccount(map);
	}

}
