package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Theme;

public interface ThemeService {
	List<Theme> findThemeByPage(Map<String,Integer> map);
	
	List<Map<String,Integer>> findeGroupNumber(int uid);
	
	//mapper写完了，  就是在service层操作，首先写好一个接口
	/**
	 * 这个接口是来查theme的总条数
	 * @return
	 */
	int findCount();
	
	List<Theme> findRandom();
}
