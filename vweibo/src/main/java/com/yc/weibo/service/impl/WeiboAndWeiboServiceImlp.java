package com.yc.weibo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.mapper.WeiboAndWeiboMapper;
import com.yc.weibo.service.WeiboAndWeiboService;

@Service("weiboAndWeiboService")
public class WeiboAndWeiboServiceImlp implements WeiboAndWeiboService {
	@Autowired
	private WeiboAndWeiboMapper weiboAndWeiboMapper;
	
	//找根weibo的id
	@Override
	public int selectWeiboAndWeibo(int wbid) {
		return weiboAndWeiboMapper.selectrootWeibo(wbid);
	}

	//插
	@Override
	public boolean insertWeiboAndWeibo(int...array) {
		return weiboAndWeiboMapper.insertWeiboAndWeibo(array) > 0 ? true : false;
	}

}
