package com.yc.weibo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.mapper.UserMapper;
import com.yc.weibo.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public WeiBoUser login(WeiBoUser user) {
		return userMapper.login(user);
	}

	@Override
	public int register(WeiBoUser user) {
		return userMapper.register(user);
	}

	@Override
	public List<Object> findUserSomethingMessag(WeiBoUser user) {
		return userMapper.findUserSomethingMessage(user);
	}

	@Override
	public int updataUserPhoto(Map<String, String> paramMap) {
		return userMapper.updataUserPhoto(paramMap);
	}

	@Override
	public WeiBoUser findInfoByWbuid(int WBUid) {
		return userMapper.findInfoByWbuid(WBUid);
	}

	@Override
	public void saveChangeUserName(Map<String, String> paramMap) {
		userMapper.saveChangeUserName(paramMap);
		
	}

	@Override
	public void changePassWord(Map<String, String> paramMap) {
		userMapper.changePassWord(paramMap);
	}

	@Override
	public void savePersonInfo(Map<String, String> paramMap) {
		userMapper.savePersonInfo(paramMap);
		
	}

	@Override
	public void saveUserTag(Map<String, String> paramMap) {
		userMapper.saveUserTag(paramMap);
		
	}

	@Override
	public void saveFindMe(Map<String, String> paramMap) {
		userMapper.saveFindMe(paramMap);
		
	}

	@Override
	public WeiBoUser quickLoginByEmail(String Uemail) {
		return userMapper.quickLoginByEmail(Uemail);
	}

	@Override
	public WeiBoUser quickLoginByPhone(String Uphone) {
		// TODO Auto-generated method stub
		return userMapper.quickLoginByPhone(Uphone);
	}

	
	//更新积分
	@Override
	public boolean updateUserAccount(Map<String, Object> map) {
		return userMapper.updateUserAccount(map) > 0 ? true : false;
	}

	@Override
	public List<WeiBoUser> findMingRen() {
		return userMapper.findMingRen();
	}

	@Override
	public void guanzhu(Map<String, Object> params) {
		userMapper.guanzhu(params);
	}

	@Override
	public List<WeiBoUser> findAllUser(WeiBoUser param) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", param.getStart());
		map.put("end", param.getEnd());
		return userMapper.findAllUser(map);
	}

	@Override
	public int delUser(String wbuids) {
		Map<String,Object> map=new HashMap<String,Object>();	
		map.put("wbuids", wbuids);
		return userMapper.delUser(map);
	}

	@Override
	public int countAllUser(WeiBoUser param) {
		
		return userMapper.countAlluser(param);
	}

}
