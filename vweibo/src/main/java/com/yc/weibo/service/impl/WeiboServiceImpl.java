package com.yc.weibo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yc.weibo.entity.Weibo;
import com.yc.weibo.mapper.WeiboMapper;
import com.yc.weibo.service.WeiboService;

@Controller("weiboService")
public class WeiboServiceImpl implements WeiboService{

	@Autowired
	private WeiboMapper weiboMapper;
	
	
	//纯view 加一
	@Override
	public boolean updateViewOnly(int wbid){
		return weiboMapper.updateViewOnly(wbid) > 0 ? true : false;
	}
	
	//插入微博
	@Override
	public boolean addWeibo(Map<String, Object> map) {
		return weiboMapper.insertWeibo(map) > 0 ? true : false;
	}
	@Override
	public int selectCurrMaxWBid() {
		return weiboMapper.selectCurrMaxWBid();
	}
	@Override
	public boolean initWeibohelp(int currWBid) {
		return weiboMapper.initWeibohelp(currWBid) > 0 ? true : false;
	}
	
	
	@Override
	public List<Map<String, Object>> findWeiboOrderByWHviewAccountFirst(Map<String, Integer> map) {
		return weiboMapper.seleteWeiboOrderByWHviewAccountFirst(map);
	}
	@Override
	public List<Map<String,Object>> findtWeiboOrderByWHgreateAccountFirst(Map<String, Integer> map) {
		return weiboMapper.selectWeiboOrderByWHgreateAccount(map);
	}
	
	@Override
	public List<Map<String, Object>> findWeiboOrderByWBdate(Map<String, Integer> map) {
		return weiboMapper.selectWeiboOrderByWBdate(map);
	}
	
	
	//点赞
	@Override
	public boolean updateaddWeiboLike(int wbid) {
		return weiboMapper.updateaddWeiboLike(wbid) > 0 ? true : false;
	}
	@Override
	public boolean updateminuWeiboLike(int wbid) {
		return weiboMapper.updateminuWeiboLike(wbid) > 0 ? true : false ;
	}
	@Override
	public int selectAfterLikeGreateAcount(int wbid) {
		return weiboMapper.selectAfterLike(wbid);
	}
	
	//收藏
	@Override
	public boolean updateCollectionAccount(int wbid) {
		return weiboMapper.updateCollectionAccount(wbid) > 0 ? true : false;
	}
	@Override
	public int selectAfterCollection(int wbid) {
		return weiboMapper.selectAfterCollection(wbid);
	}

	//转发
	@Override
	public String selectTransmityon(int wbid) {
		return weiboMapper.selectTransmityon(wbid);
	}
	@Override
	public List<Map<String,Object>> selectWeiboandweiboHelpById(int wbid){
		return weiboMapper.selectWeiboandweiboHelpById(wbid);
	}
	@Override
	public boolean insertWeiboByTransmit(Map<String,Object> map){
		return weiboMapper.insertWeiboByTransmit(map) > 0 ? true : false;
	}
	@Override
	public boolean updateTransmitAccount(int wbid){
		return weiboMapper.updateTransmitAccount(wbid) > 0 ? true : false;
	}
	
	
	
	
	@Override
	public List<Map<String, Object>> findHotWeiBo(Map<String, Integer> map) {
		
		return weiboMapper.findHotWeiBo(map);
	}
	@Override
	public List<Map<String, Object>> findFriendWeiBo(Map<String, Integer> params) {
		return weiboMapper.findFriendWeiBo(params);
	}
	@Override
	public List<Weibo> myCollections(int WBUid) {
		return weiboMapper.myCollections(WBUid);
	}
	@Override
	public List<Weibo> findMyZan(int WBUid) {
		return weiboMapper.findMyZan(WBUid);
	}

	@Override
	public List<Map<String, Object>> findWeiBoByWBtag(Map<String, Object> params) {
		return weiboMapper.findWeiBoByWBtag(params);
	}

	@Override
	public List<Weibo> findpersonal(int WBUid) {
		return weiboMapper.findpersonal(WBUid);
	}

	@Override
	public List<Map<String, Object>> findGroupWeiBo(Map<String, Integer> params) {
		return weiboMapper.findGroupWeiBo(params);
	}

	@Override
	public List<Map<String, Object>> findMoreAttentionWeiBo(Map<String, Integer> params) {
		return weiboMapper.findMoreAttentionWeiBo(params);
	}

}
