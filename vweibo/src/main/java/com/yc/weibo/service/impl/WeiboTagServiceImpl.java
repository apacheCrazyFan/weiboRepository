package com.yc.weibo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yc.weibo.entity.WeiboTag;
import com.yc.weibo.mapper.WeiboTagMapper;
import com.yc.weibo.service.WeiboTagService;

@Controller("weiboTagService")
public class WeiboTagServiceImpl implements WeiboTagService {
	@Autowired
	private WeiboTagMapper weiboTagMapper;
	
	/**
	 * 删除微博标签
	 */
	@Override
	public boolean delWeiboTag(String tids) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("ids", tids);
		return weiboTagMapper.del(params) > 0 ? true : false;
	}

	/**
	 * 更新微博标签
	 */
	@Override
	public boolean updateWeiboTag(Map<String,String> idAndName) {
		return weiboTagMapper.update(idAndName) > 0 ? true : false;
	}

	/**
	 * 插入微博标签
	 */
	@Override
	public boolean addWeiboTag(String wTname) {
		return weiboTagMapper.insert(wTname) > 0 ? true : false;
	}

	/**
	 * 无条件查询所有的微博标签
	 */
	@Override
	public List<WeiboTag> findAllWeiboTag() {
		return weiboTagMapper.findAll();
	}

	/**
	 * 分页查询微博标签
	 */
	@Override
	public List<WeiboTag> findWeiboTagByPage(Map<String,Integer> sizeAndNum) {
		return weiboTagMapper.findByPage(sizeAndNum);
	}

}
