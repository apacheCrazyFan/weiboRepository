package com.yc.weibo.handler;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.apache.logging.log4j.LogManager;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/publish")
public class WeiboHandler {
	@Autowired 
	private ServletContext servletContext;
	/*@Autowired
	private PageContext content;*/
	
	@RequestMapping(value="/weibo",method=RequestMethod.POST)
	public String publishWeibo(HttpServletRequest request){
		/*System.out.println( "wo lai le");
		UploadUtil uploadUtil = new UploadUtil();
		try {
			uploadUtil.upload(content);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		
		//static Logger logger = Logger.getLogger(UploadController.class); 
		 try{  
			 
	            boolean isMultipart = ServletFileUpload.isMultipartContent(request);   
	            LogManager.getLogger().debug("命中目标1："+isMultipart);  
	            LogManager.getLogger().debug("文件名："+request.getParameter("name"));  
	            if(isMultipart){    
	                String fileName = request.getParameter("name");  
	                FileItemFactory factory = new DiskFileItemFactory();  
	                //ServletFileUpload对象的创建需要依赖FileItemFactory工厂将获得的上传文件FileItem对象保存至服务器硬盘，即DiskFileItem对象  
	                ServletFileUpload upload = new ServletFileUpload(factory);  
	                //设置允许上传的最大文件大小 4M  
	                upload.setSizeMax(4*1024*1024);  
	                //解析http请求消息头  
	                List<FileItem> fileItems = upload.parseRequest(new ServletRequestContext(request));  
	                Iterator iter = fileItems.iterator();  
	                //要执行while内逻辑，需在bean文件中有相应配置，后面会有说明。  
	                while(iter.hasNext()){  
	                    FileItem item = (FileItem)iter.next();  
	                    if(item.isFormField()){  
	                        System.out.println("处理表单内容");  
	                        this.processFormField(item,fileName);  
	                    }else{  
	                        System.out.println("处理上传文件");  
	                        this.processUploadFile(item,fileName,servletContext);  
	                    }  
	                }  
	            }   
	            return "upload file ok";  
	        }catch(Exception e){  
	            System.out.println("使用 fileupload 包时发生异常 ...");   
	            e.printStackTrace();  
	            return "upload file error";  
	        }  
	}
	
	public void processFormField(FileItem item, String fileName) {  
        String name = item.getFieldName();  
        String value = item.getString();  
        LogManager.getLogger().debug("表单域名为：" + name + "值为：" + value);  
    }  
      
    public void processUploadFile(FileItem item, String fileName,ServletContext servletContext){  
    	System.out.println( item);
        String filename = null;  
        //获得文件名，此文件名包含路径  
        if(fileName!=null){  
            filename = fileName;  
        }else{  
            filename = item.getName();  
        }  
        LogManager.getLogger().debug("文件名："+filename);  
        System.out.println( servletContext.getRealPath(filename));
        if(filename!=null){  
            File file = new File(filename);  
            
            LogManager.getLogger().debug("创建文件对象File:"+file);  
            String path = "../weiboPics/"+fileName;  
              
            //判断路径是否存在  
            File dirFile = new File(path);  
            if(!dirFile.exists()){  
                dirFile.mkdirs();  
            }  
  
            File filetoserver = new File(path,file.getName());    
            try{  
                item.write(filetoserver);   
            }catch(Exception e){  
            	LogManager.getLogger().debug("文件上传服务器，写入异常");  
                e.printStackTrace();  
            }  
            LogManager.getLogger().debug("文件:" + filetoserver.getName() + "上传成功");  
        }else{  
        	LogManager.getLogger().debug("文件上传失败");  
        }     
    }  
} 
