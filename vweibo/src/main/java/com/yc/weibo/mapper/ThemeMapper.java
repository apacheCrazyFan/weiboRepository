package com.yc.weibo.mapper;

import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Theme;

public interface ThemeMapper {
	List<Theme> findThemeByPage(Map<String,Integer> map);
	
	List<Map<String,Integer>> findeGroupNumber(int uid);
}
