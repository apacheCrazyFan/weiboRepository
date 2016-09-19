package com.yc.weibo.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.weibo.entity.Fan;
import com.yc.weibo.service.FanService;


@Controller
@RequestMapping("message")
public class FanController {
	@Autowired
	private FanService fanService;
	
	@ResponseBody//这个可以直接返回一个对象作为json，我们返回一个map就可以了，这就是和easyui的交互规定，你想用就要照着他的规定来
	@RequestMapping("getFstatusByFuid")//自动注入的参数，这里的param就已经包含了easyui封装过来的分页的参数了
	public List<Fan> getFstatusByFuid(int fuid){
		System.out.println(fanService.getFstatusByFuid(fuid));
		return fanService.getFstatusByFuid(fuid);
	}
	
	@ResponseBody
	@RequestMapping("getFuedidByFstatus")
	public List<Fan> getFuedidByFstatus(int fuid,String fstatus){
		return fanService.getFuedidByFstatus(fuid, fstatus);
	}
	
	@ResponseBody//这个可以直接返回一个对象作为json，我们返回一个map就可以了，这就是和easyui的交互规定，你想用就要照着他的规定来
	@RequestMapping("getTalkNameFromFuedid")//自动注入的参数，这里的param就已经包含了easyui封装过来的分页的参数了
	public List<Fan> getTalkNameFromFuedid(int fuedid){
		return fanService.getTalkNameFromFuedid(fuedid);
	}
}
