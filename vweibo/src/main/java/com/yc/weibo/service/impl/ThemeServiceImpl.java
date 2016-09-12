package com.yc.weibo.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.weibo.entity.Theme;
import com.yc.weibo.mapper.ThemeMapper;
import com.yc.weibo.service.ThemeService;

@Service("themeService")
public class ThemeServiceImpl implements ThemeService {
	@Autowired
	private ThemeMapper themeMapper;

	@Override
	public List<Map<String, Integer>> findeGroupNumber(int uid) {
		return themeMapper.findeGroupNumber(uid);
	}

	@Override
	public int findCount() {
		return themeMapper.findCount();
	}

	@Override
	public List<Theme> findRandom() {
		Random r = new Random();
		// 先查出总数
		Map<String, String> map = new HashMap<String, String>();
		int num = 0;
		int total = themeMapper.findCount();
		// 在随机数中确定范围
		while (map.size() < 10) {// 指定一个条件，让他不断抽取，直到满足，比如 抽取了10个在范围内的不重复的数
			num = r.nextInt(total) + 1;// 这样随机会在这个范围内随意抽取，但是可能重复
			map.put(num + "", num + "");// 去重，怎么弄，？：利用Map的key值不能重复的特性
		}

		// 现在map里面就都是不重复的随机数了
		StringBuffer str_num = new StringBuffer();

		for (Iterator iter = map.keySet().iterator(); iter.hasNext();) {
			String key = (String) iter.next();
			String value = (String) map.get(key);
			str_num.append(value + ",");
		}
		//System.out.println(str_num.subSequence(0, str_num.lastIndexOf(",")));// 随机数组已经维护好了
		
		Map<String,String> param=new HashMap<String,String>();
		param.put("str", str_num.subSequence(0, str_num.lastIndexOf(",")).toString());
		return  themeMapper.findRandom(param);
	}

	@Override
	public List<Theme> findThemeByPage(Theme theme) {
		return themeMapper.findAllTheme(theme);//可以了，
	}

}
