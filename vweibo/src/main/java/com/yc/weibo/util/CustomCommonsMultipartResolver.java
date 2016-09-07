package com.yc.weibo.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.yc.weibo.DataDic.DataDic;

@Controller
@RequestMapping("/vweibo")
public class CustomCommonsMultipartResolver{
	
	@RequestMapping(value="/publish",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> publishWeibo(HttpServletRequest request){
		System.out.println( "wo dao CustomCommonsMultipartResolver lai le");
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		//创建一个通用的多部分解析器.  
		   CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
		//设置编码  
		   commonsMultipartResolver.setDefaultEncoding("utf-8");  
		 //判断 request 是否有文件上传,即多部分请求...  
		 if (commonsMultipartResolver.isMultipart(request))  
		   {  
		      //转换成多部分request  
		      MultipartHttpServletRequest multipartRequest = commonsMultipartResolver.resolveMultipart(request);  
		   // file 是指 文件上传标签的 name=值  
		    // 根据 name 获取上传的文件...  
		    MultipartFile file = multipartRequest.getFile("myPicFile");  
		   
		    //上传后记录的文件...     
		    File imageFile = new File(DataDic.PICPATH); 
		    
		    if(!imageFile.exists()){
		    	imageFile.mkdirs();
		    }
		    //上传...  
		    try {
				file.transferTo(imageFile);
				
				jsonMap.put("statue", 1);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}  
		  
		    }  
		 return jsonMap;
	}
}
