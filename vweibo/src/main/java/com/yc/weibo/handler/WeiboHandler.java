package com.yc.weibo.handler;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yc.weibo.DataDic.DataDic;
import com.yc.weibo.service.WeiboService;
import com.yc.weibo.util.AddressUtil;


@Controller
@RequestMapping("/weibo")
public class WeiboHandler {
	@Autowired 
	private ServletContext servletContext;
	@Autowired
	private WeiboService weiboService;
	
	@RequestMapping(value="/publish",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> publishWeibo(@RequestParam("myPicFile") MultipartFile picfile,@RequestParam("myVideoFile") MultipartFile videofile,HttpServletRequest request){
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
        if(picfile.isEmpty() && videofile.isEmpty()){
            jsonMap.put("status", -1);
            jsonMap.put("result", "【文件为空！】");

            return jsonMap;
        }
        ////得到文件名称 
        String picfileName=picfile.getOriginalFilename();
        String videofileName=videofile.getOriginalFilename();
        
        System.out.println( picfileName + "   ===  "+videofileName);
        //
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
       // String uploadPath=request.getSession().getServletContext().getRealPath(Constants.UPLOAD_FILE_DIR+sdf.format(new Date()));
       // System.out.println(uploadPath);
      //判断文件夹是否存在 
       // File uploadDir=new File(uploadPath);
      //判断是否存在目录 
       // if(!uploadDir.exists()){
        //    uploadDir.mkdirs();
       // }
        
        //
		Map<String,Object> map = uploadFile(request);
		map.put("weibomap", map);
		
		//
		//File uploadFile=new File(uploadPath+"/"+fileName);
       // file.transferTo(uploadFile);//上传
        System.out.println("上传成功！");
        jsonMap.put("status", 1);
        jsonMap.put("result", "【上传成功！】");
        weiboService.addWeibo(map);
        
        
        return jsonMap;
        
		//
		
	}
	
	private Map<String, Object> uploadFile(HttpServletRequest request){
		//static Logger logger = Logger.getLogger(UploadController.class); 
		Map<String,Object> map = null;
		 try{  
			 request.setCharacterEncoding("UTF-8");
			 
	            boolean isMultipart = ServletFileUpload.isMultipartContent(request);   
	            LogManager.getLogger().debug("命中目标1："+isMultipart);  
	            //LogManager.getLogger().debug("文件名："+request.getParameter("textContent"));  
	            if(isMultipart){
	            	map = new HashMap<String,Object>();
	                String rootPathName = "";  
	                
	                FileItemFactory factory = new DiskFileItemFactory();  
	                //ServletFileUpload对象的创建需要依赖FileItemFactory工厂将获得的上传文件FileItem对象保存至服务器硬盘，即DiskFileItem对象  
	                ServletFileUpload upload = new ServletFileUpload(factory);  
	                //设置允许上传的最大文件大小5M  
	                upload.setSizeMax(500*1024*1024);  
	                //解析http请求消息头  
	                List<FileItem> fileItems = upload.parseRequest(new ServletRequestContext(request));  
	                Iterator iter = fileItems.iterator();  
	                
	                String picsMap = "";
	                String videoesMap = "";
	                String musicMap = "";
	                
	                String txtContent = "";
	                while(iter.hasNext()){  
	                    FileItem item = (FileItem)iter.next();  
	                    if(item.isFormField() && item.toString() != null){ 
	                    	txtContent += item.getString().trim();
	                        System.out.println("处理表单内容");  
	                        this.processFormField(item);  
	                    }else if(item.getName() != null && item.getName() != "null"){
	                    	
	                        System.out.println("处理上传文件");  
	                        String fileTempName = item.getName();
	                        System.out.println( "================="+fileTempName);
	                        if(DataDic.PICTURESUFFIX.toLowerCase().contains(fileTempName.substring(fileTempName.lastIndexOf(".")+1).toLowerCase())){
	                        	picsMap += fileTempName+",";
	                        	rootPathName = DataDic.PICPATH;
	                        }else if(DataDic.VIDEOSUFFIX.toLowerCase().contains(fileTempName.toLowerCase().substring(fileTempName.lastIndexOf(".")+1).toLowerCase())){
	                        	videoesMap += fileTempName+",";
	                        	rootPathName = DataDic.VIDEOPATH;
	                        }else if(DataDic.MUSICSUFFIX.toLowerCase().contains(fileTempName.toLowerCase().substring(fileTempName.lastIndexOf(".")+1).toLowerCase())){
	                        	musicMap += fileTempName+",";
	                        	rootPathName = DataDic.MUSICPATH;
	                        }
	                        this.processUploadFile(item,fileTempName,rootPathName,servletContext);  
	                    }  
	                } 
	                System.out.println( picsMap);
	                SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                Date date=new Date();

	                map.put("userlocation", AddressUtil.getLocation());
	                map.put("publishDate", dateFormater.format(date));
	                map.put("weiboTag", null);
	                map.put("txtContent", txtContent);
	                if(txtContent.contains("[[") && txtContent.contains("]]")){
	                	map.put("weiboTitle", txtContent.substring(txtContent.indexOf("[["), txtContent.indexOf("]]")+2)); //截取标题
	                }else{
	                	map.put("weiboTitle", null);
	                }
	                if(!picsMap.equals("")){
	                	map.put("picsMap", picsMap.substring(0, picsMap.length()-1));
	                }else{
	                	map.put("picsMap", null);
	                }
	                if(!videoesMap.equals("")){
	                	map.put("videoesMap", videoesMap.substring(0, videoesMap.length()-1));
	                }else{
	                	map.put("videoesMap", null);
	                }
	                if(!musicMap.equals("")){
	                	map.put("musicMap", musicMap.substring(0, musicMap.length()-1));
	                }else{
	                	map.put("musicMap", null);
	                }
	            }   
	            return map;  
	        }catch(Exception e){  
	            System.out.println("使用 fileupload 包时发生异常 ...");   
	            e.printStackTrace();  
	            return map;  
	        }  
	}
	
	public void processFormField(FileItem item) {  
        String name = item.getFieldName();  
        String value = item.getString();  
        LogManager.getLogger().debug("表单域名为：" + name + "值为：" + value);  
    }  
      
	/**
	 * 上传文件包括视屏，图片，音乐
	 * @param item  文件
	 * @param fileName 文件名
	 * @param rootPathName  在webapps中的保存文件的文件名
	 * @param servletContext 主要用来获得当前项目的路径
	 */
    public void processUploadFile(FileItem item, String fileName,String rootPathName,ServletContext servletContext){  
    	//System.out.println( item);
         
       // LogManager.getLogger().debug("文件名："+fileName);  
    	String savePath = servletContext.getRealPath(fileName).substring(0, servletContext.getRealPath(fileName).indexOf(DataDic.PROJECTNAME)-1);
        System.out.println( servletContext.getRealPath(fileName));
           
        String path = savePath+rootPathName;  
        System.out.println(path+"   =====   "+rootPathName);
             File file = new File(fileName);
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
        /*}else{  
        	LogManager.getLogger().debug("文件上传失败");  
        }*/     
    }  
} 
