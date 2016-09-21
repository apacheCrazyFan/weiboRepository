package com.yc.weibo.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.weibo.entity.PrivateMessage;
import com.yc.weibo.service.PMService;



@Controller
@RequestMapping("message")
public class PMController {
	@Autowired
	private PMService pmService;
	
	@ResponseBody//这个可以直接返回一个对象作为json，我们返回一个map就可以了，这就是和easyui的交互规定，你想用就要照着他的规定来
	@RequestMapping("getMessageByPMUser")//自动注入的参数，这里的param就已经包含了easyui封装过来的分页的参数了
	public List<PrivateMessage> getMessageByPMUser(int pm1user,int pm2user){
		return pmService.getMessageByPMUser(pm1user, pm2user);
	}
	
	@ResponseBody//这个可以直接返回一个对象作为json，我们返回一个map就可以了，这就是和easyui的交互规定，你想用就要照着他的规定来
	@RequestMapping("talkToPmUser")//自动注入的参数，这里的param就已经包含了easyui封装过来的分页的参数了
	public int talkToPmUser(int pm1user,int pm2user,String pmcontent){
		pmService.talkToPmUser(pm1user, pm2user, pmcontent);
		return 1;
	}
	
	@ResponseBody//这个可以直接返回一个对象作为json，我们返回一个map就可以了，这就是和easyui的交互规定，你想用就要照着他的规定来
	@RequestMapping("checkPMIfRead")//自动注入的参数，这里的param就已经包含了easyui封装过来的分页的参数了
	public List<PrivateMessage> checkPMIfRead(int pm2user){
		return pmService.checkPMIfRead(pm2user);
	}
	
	@ResponseBody//这个可以直接返回一个对象作为json，我们返回一个map就可以了，这就是和easyui的交互规定，你想用就要照着他的规定来
	@RequestMapping("PMIsRead")//自动注入的参数，这里的param就已经包含了easyui封装过来的分页的参数了
	public int PMIsRead(int pm1user,int pm2user){
		pmService.PMIsRead(pm1user, pm2user);
		return 1;
	}
}
