package com.yc.weibo.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.weibo.entity.MessageResp;
import com.yc.weibo.entity.Theme;
import com.yc.weibo.service.ThemeService;

@Controller
@RequestMapping("/theme")
public class ThemeHandler {
	@Autowired
	private ThemeService themeService;

	@RequestMapping(value = "/random", method = RequestMethod.POST)
	@ResponseBody
	public List<Theme> random() {
		return themeService.findRandom();
	}
	
	@ResponseBody//这个可以直接返回一个对象作为json，我们返回一个map就可以了，这就是和easyui的交互规定，你想用就要照着他的规定来
	@RequestMapping("findAllThemeByPage")//自动注入的参数，这里的param就已经包含了easyui封装过来的分页的参数了
	public Map<String,Object> findAllThemeByPage(Theme param,HttpServletRequest request,HttpServletResponse response){
		//需要准备好 ，   theme的总数，，，和list的内容，  一个给easy的数据信息，一个是用来计算分页的，
		List<Theme> list=themeService.findThemeByPage(param);
		int total=themeService.findCount();
		Map<String,Object> map=new HashMap<String,Object>();//ctrl+shift+o  全类的自动导入，有不确定的会弹框问你，
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
	
	@ResponseBody
	@RequestMapping({"addTheme"})//也可以这么写，里面就是第一个数组，你可以配置多个名字
	public MessageResp addTheme(Theme theme,String tname,HttpServletRequest request,HttpServletResponse response){
		int result=themeService.addTheme(theme);
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
	
	@ResponseBody
	@RequestMapping({"updateTheme"})
	public MessageResp updateTheme(Theme theme,HttpServletRequest request,HttpServletResponse response){
		int result=themeService.updateTheme(theme);
		MessageResp mes=new MessageResp();
		if(result>0){
			mes.setCode(1);
			mes.setDesc("修改成功");
			return mes;
		}else{
			mes.setCode(0);
			mes.setDesc("修改失败");
			return mes;
		}
	}
	
	@ResponseBody
	@RequestMapping("delTheme")
	public MessageResp delTheme(String tids){
		int result=themeService.delTheme(tids);
		MessageResp mes=new MessageResp();
		if(result>0){
			mes.setCode(1);
			mes.setDesc("删除成功");
			return mes;
		}else{
			mes.setCode(0);
			mes.setDesc("删除失败");
			return mes;
		}
	}
}
