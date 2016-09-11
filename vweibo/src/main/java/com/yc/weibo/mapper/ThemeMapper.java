package com.yc.weibo.mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Theme;

public interface ThemeMapper {
    int deleteByPrimaryKey(BigDecimal tid);

    int insert(Theme record);

    int insertSelective(Theme record);

    Theme selectByPrimaryKey(BigDecimal tid);

    int updateByPrimaryKeySelective(Theme record);

    int updateByPrimaryKeyWithBLOBs(Theme record);

    int updateByPrimaryKey(Theme record);
    
	List<Theme> findThemeByPage(Map<String, Integer> map);

	List<Map<String,Integer>> findeGroupNumber(int uid);
	
	/**
	 * 用来查询sql语句，查出现在数据库有多少条theme记录
	 * @return
	 */
	int findCount();//写一个对应的sql的方法
	
	List<Theme> findRandom(Map<String,String> map);
    
}