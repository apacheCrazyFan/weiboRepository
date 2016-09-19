package com.yc.weibo.mapper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.yc.weibo.entity.Theme;

public interface ThemeMapper {
	/**
	 * 这个就是删除的，通过id，好用
	 * @param tid
	 * @return
	 */
    int deleteByPrimaryKey(BigDecimal tid);

    int insert(Theme record);

    /**
     * 插入不为null的参数，好用
     * @param record
     * @return
     */
    int insertSelective(Theme record);

    Theme selectByPrimaryKey(BigDecimal tid);

    /**
     * 更新，根据主键， 更新不为null的 值，好用
     * @param record  
     * @return
     */
    int updateByPrimaryKeySelective(Theme record);

    int updateByPrimaryKeyWithBLOBs(Theme record);

    int updateByPrimaryKey(Theme record);
    
    
	List<Map<String,Integer>> findeGroupNumber(int uid);
	
	/**
	 * 用来查询sql语句，查出现在数据库有多少条theme记录
	 * @return
	 */
	int findCount();//写一个对应的sql的方法
	
	/**
	 * 根据给定的数字字符串，随机的抽取一定数量的Theme
	 * @param map
	 * @return
	 */
	List<Theme> findRandom(Map<String,String> map);
	
	/**
	 * 查询所有的theme ，传入参数主要使用来接收start和end两个分页的参数，封装在baseEntity中，并由theme继承
	 * @param theme  看好这里的参数，要传进来的是一个   THeme
	 * @return
	 */
	List<Theme> findAllTheme(Theme theme);
	
	List<Theme> findThemeByTname(Theme theme);
	
}