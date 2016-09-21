package com.yc.weibo.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.weibo.entity.WeiboTag;
import com.yc.weibo.service.WeiboTagService;

@Controller
@RequestMapping("/weibotag")
public class WeiboTagHandler {
	@Autowired
	private WeiboTagService weiboTagService;
	
	@RequestMapping("/findAllWeiboTagByPage")
	@ResponseBody
	public Map<String,Object> findAllWeiboTagByPage(Integer rows,Integer page){
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("pageSize", rows);
		map.put("pageNum", page);
		
		List<WeiboTag> wts  = weiboTagService.findWeiboTagByPage(map);
		List<WeiboTag> wtss = weiboTagService.findAllWeiboTag();
		Map<String,Object> mp = new HashMap<String,Object>();
		mp.put("rows", wts);
		mp.put("total", wtss.size());
		
		return mp;
	}
	/*@RequestMapping("/delWeiboTag")  ///删除标签
	public void delWeiboTag(HttpServletRequest request,PrintWriter out){
		String tids = request.getParameter("tids");
		if(weiboTagService.delWeiboTag(tids)){
			out.println(1);
			out.flush();
			out.close();
		}else{
			out.println(-1);
			out.flush();
			out.close();
		}
		
	}*/
	
	
	@RequestMapping("/delWeiboTag")  ///删除标签
	@ResponseBody
	public int delWeiboTag(String wtids){
		System.out.println( wtids);
		if(weiboTagService.delWeiboTag(wtids)){
			return 1;
		}else{
			return -1;
		}
		
	}
	
	@RequestMapping("/updateWeiboTag")  //更新微博标签
	@ResponseBody
	public int updateWeiboTag(String wtid,String wtname){
		Map<String,String> idAndName = new HashMap<String,String>();
		idAndName.put("wtid", wtid);
		idAndName.put("wtname", wtname);
		if(weiboTagService.updateWeiboTag(idAndName)){
			return 1;
		}else{
			return -1;
		}
		
	}
	
	@RequestMapping("/addWeiboTag")  //更新微博标签
	@ResponseBody
	public int addWeiboTag(String wtname){
		if(weiboTagService.addWeiboTag(wtname)){
			return 1;
		}else{
			return -1;
		}
		
	}
}
