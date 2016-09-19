package com.yc.weibo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.weibo.entity.Fan;

public interface FanMapper {
	List<Fan> getFstatusByFuid(@Param("fuid")int fuid);
	
	List<Fan> getFuedidByFstatus(@Param("fuid")int fuid,@Param("fstatus")String fstatus);
	
	List<Fan> getTalkNameFromFuedid(@Param("fuedid")int fuedid);
}
