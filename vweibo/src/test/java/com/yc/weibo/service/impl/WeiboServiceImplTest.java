package com.yc.weibo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class WeiboServiceImplTest {
	@Autowired
	private WeiboServiceImpl weiboService;
	@Test
	public void test() {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("pageSize", 10);
		map.put("pageNum",1);
		List<Map<String, Object>> list = weiboService.findWeiboOrderByWHviewAccountFirst(map);
		System.out.println( list);
	}
	
	

}
