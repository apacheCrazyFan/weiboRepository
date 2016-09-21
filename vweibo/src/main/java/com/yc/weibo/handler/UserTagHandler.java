package com.yc.weibo.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.weibo.entity.MessageResp;
import com.yc.weibo.entity.UserTag;
import com.yc.weibo.service.UserTagService;

@Controller
@RequestMapping("/usertag")
public class UserTagHandler {
	@Autowired
	private UserTagService userTagService;
	
	@RequestMapping("/findAllUserTagByPage")
	@ResponseBody
	public Map<String,Object> findAllWeiboTagByPage(Integer rows,Integer page){
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("pageSize", rows);
		map.put("pageNum", page);
		
		List<UserTag> wts  = userTagService.findUserTagByPage(map);
		List<UserTag> wtss = userTagService.findAllUserTag();
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
	
	
	@RequestMapping("/delUserTag")  ///删除标签
	@ResponseBody
	public int delUserTag(String utids){
		System.out.println( utids);
		if(userTagService.delUserTag(utids)){
			return 1;
		}else{
			return -1;
		}
		
	}
	
	@RequestMapping("/updateUserTag")  //更新用户标签
	@ResponseBody
	public MessageResp updateUserTag(String utid,String utname,String utfid){
		Map<String,Object> idAndName = new HashMap<String,Object>();
		idAndName.put("utid", Integer.parseInt(utid));//在这里控制类型，你全部都用String做为值的类型进去，  还怎么做转换，，，，，
		idAndName.put("utname", utname);
		idAndName.put("utfid", Integer.parseInt(utfid));
		MessageResp mes=new MessageResp();
		if(userTagService.updateUserTag(idAndName)){
			mes.setCode(1);
			mes.setDesc("添加成功");
			return mes;
		}else{
			mes.setCode(0);
			mes.setDesc("添加失败");
			return mes;
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping({"addUserTag"})//前端写好了，要改会影响之前的编辑操作，改这里，就肯定要一直，不然你就写成
	public MessageResp addTheme(UserTag usertag,String utfid,String utname,HttpServletRequest request,HttpServletResponse response){
		//因为传进来的对象会自己实体化，懒得自己去写了，，， 如果你用了mvc给你自动注入（实体对象 UserTag），那你就要把前台那边的和实体类里面统一，如果是自己写参数列表（String utfid,String utname），就随便，只要两边统一的就可以，在mapper里面，如果使用实体类，就用实体类里面的名称来取，如果是用的map，就用键值
		usertag.setUTFid(Integer.parseInt(utfid));//这个的页面，找出来，
		usertag.setUTname(utname);
		int result=userTagService.addUserTag(usertag);
		MessageResp mes=new MessageResp();
		if(result>0){
			mes.setCode(1);
			mes.setDesc("添加成功");
			return mes;
		}else{
			mes.setCode(0);
			mes.setDesc("添加失败");
			return mes;
		}
	}
}
