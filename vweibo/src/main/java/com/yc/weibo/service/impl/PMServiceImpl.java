package com.yc.weibo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.entity.PrivateMessage;
import com.yc.weibo.mapper.PMMapper;
import com.yc.weibo.service.PMService;

@Service("pMService")
public class PMServiceImpl implements PMService {
	@Autowired
	private PMMapper pmMapper;
	
	@Override
	public List<PrivateMessage> getMessageByPMUser(int pm1user, int pm2user) {
		return pmMapper.getMessageByPMUser(pm1user, pm2user);
	}

	@Override
	public int talkToPmUser(int pm1user, int pm2user, String pmcontent) {
		return pmMapper.talkToPmUser(pm1user, pm2user, pmcontent);
	}

	@Override
	public List<PrivateMessage> checkPMIfRead(int pm2user) {
		return pmMapper.checkPMIfRead(pm2user);
	}

	@Override
	public int PMIsRead(int pm1user, int pm2user) {
		return pmMapper.PMIsRead(pm1user, pm2user);
	}

}
