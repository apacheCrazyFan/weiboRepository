package com.yc.weibo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yc.weibo.mapper.WeiBoHelpMapper;
import com.yc.weibo.service.WeiBoHelpService;

@Controller("weiBoHelpSercice")
public class WeiBoHelpServiceImpl implements WeiBoHelpService {
	@Autowired
	private WeiBoHelpMapper weiBoHelpMapper;
	
	@Override
	public int selectWBreprintaccountOnly(int wbid) {
		return weiBoHelpMapper.selectWBreprintaccountOnly(wbid);
	}

}
