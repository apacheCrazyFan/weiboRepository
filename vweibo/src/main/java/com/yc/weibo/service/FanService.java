package com.yc.weibo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.weibo.entity.Fan;

public interface FanService {
	List<Fan> getFstatusByFuid(int fuid);

	List<Fan> getFuedidByFstatus(int fuid,String fstatus);
	
	List<Fan> getTalkNameFromFuedid(int fuedid);
}
