package com.yc.weibo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yc.weibo.entity.PrivateMessage;

public interface PMService {
	List<PrivateMessage> getMessageByPMUser(int pm1user,int pm2user);
	
	int talkToPmUser(int pm1user,int pm2user,String pmcontent);
	
	List<PrivateMessage> checkPMIfRead(int pm2user);
	
	int PMIsRead(int pm1user,int pm2user);
}
