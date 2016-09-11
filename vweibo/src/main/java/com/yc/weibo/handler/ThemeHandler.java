package com.yc.weibo.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
