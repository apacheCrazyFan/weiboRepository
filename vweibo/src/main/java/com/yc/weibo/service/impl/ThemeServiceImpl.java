package com.yc.weibo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.entity.Theme;
import com.yc.weibo.mapper.ThemeMapper;
import com.yc.weibo.service.ThemeService;

@Service("themeService")
public class ThemeServiceImpl implements ThemeService {
	@Autowired
	private ThemeMapper themeMapper;
	
	/**
	 * 纯粹找话题名
	 */
	@Override
	public List<Theme> findThemeByPage(Map<String, Integer> map) {
		return themeMapper.findThemeByPage(map);
	}

	@Override
	public List<Map<String, Integer>> findeGroupNumber(int uid) {
		return themeMapper.findeGroupNumber(uid);
	}

}
