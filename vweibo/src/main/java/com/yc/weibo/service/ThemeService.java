package com.yc.weibo.service;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Theme;

public interface ThemeService {
	List<Theme> findThemeByPage(Map<String,Integer> map);
	
	List<Map<String,Integer>> findeGroupNumber(int uid);
}
