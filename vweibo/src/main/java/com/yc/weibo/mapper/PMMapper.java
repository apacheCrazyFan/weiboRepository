package com.yc.weibo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.weibo.entity.PrivateMessage;

public interface PMMapper {
	List<PrivateMessage> getMessageByPMUser(@Param("pm1user")int pm1user,@Param("pm2user")int pm2user);
	
	int talkToPmUser(@Param("pm1user")int pm1user,@Param("pm2user")int pm2user,@Param("pmcontent")String pmcontent);
	
	List<PrivateMessage> checkPMIfRead(@Param("pm2user")int pm2user);
	
	int PMIsRead(@Param("pm1user")int pm1user,@Param("pm2user")int pm2user);
}
