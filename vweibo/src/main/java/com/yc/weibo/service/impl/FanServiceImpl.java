package com.yc.weibo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.entity.Fan;
import com.yc.weibo.mapper.FanMapper;
import com.yc.weibo.service.FanService;



@Service("fanService")
public class FanServiceImpl implements FanService{
	@Autowired
	private FanMapper fanMapper;

	@Override
	public List<Fan> getFstatusByFuid(int fuid) {
		return fanMapper.getFstatusByFuid(fuid);
	}

	@Override
	public List<Fan> getFuedidByFstatus(int fuid, String fstatus) {
		return fanMapper.getFuedidByFstatus(fuid, fstatus);
	}

	@Override
	public List<Fan> getTalkNameFromFuedid(int fuedid) {
		return fanMapper.getTalkNameFromFuedid(fuedid);
	}
	
	
}
