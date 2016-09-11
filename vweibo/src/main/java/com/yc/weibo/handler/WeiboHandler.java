package com.yc.weibo.handler;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yc.weibo.DataDic.DataDic;
import com.yc.weibo.entity.WeiBoUser;
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
	public Map<String,Object> publishWeibo(MultipartHttpServletRequest multipartRequest,HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> jsonMap = new HashMap<String, Object>();

		/*@RequestParam(name="myPicFile",required=false) CommonsMultipartFile myPicFile,
		@RequestParam(name="myVideoFile",required=false) CommonsMultipartFile myVideoFile,*/

		String picsMap = "";
		String videoMap = "";
		String musicMap = "";

		for (Iterator it = multipartRequest.getFileNames(); it.hasNext();) {  
			String key = (String) it.next();  
			MultipartFile uploadFile = multipartRequest.getFile(key);  
			if(uploadFile != null){
				String fileName = uploadFile.getName();   //一个一个的文件名
				String originalFilename = uploadFile.getOriginalFilename();

				if (originalFilename.length() > 0) {   //有文件
					String rootDir = "";

					if(DataDic.PICTURESUFFIX.toLowerCase().contains(originalFilename.substring(originalFilename.lastIndexOf(".")+1).toLowerCase())){ //如果是图片文件
						picsMap += originalFilename+",";
						rootDir = DataDic.PICPATH;
					}
					if(DataDic.MUSICSUFFIX.toLowerCase().contains(originalFilename.substring(originalFilename.lastIndexOf(".")+1).toLowerCase())){  //如果是视频文件
						musicMap += originalFilename+",";
						rootDir = DataDic.MUSICPATH;
					}
					if(DataDic.VIDEOSUFFIX.toLowerCase().contains(originalFilename.substring(originalFilename.lastIndexOf(".")+1).toLowerCase())){  //如果是视频文件
						videoMap += originalFilename+",";
						rootDir = DataDic.VIDEOPATH;
					}
					//Constant.UPLOAD_GOODIMG_URL 是一个配置文件路径  
					try {  
						String uploadFileUrl = servletContext.getRealPath(rootDir).
								substring(0, servletContext.getRealPath(rootDir).lastIndexOf(DataDic.PROJECTNAME)-1)+rootDir; 
						File _apkFile = saveFileFromInputStream(uploadFile.getInputStream(), uploadFileUrl, originalFilename);  
						if (_apkFile.exists()) {  //说明上传成功了，然后插入数据库？
							//FileInputStream fis = new FileInputStream(_apkFile);

							jsonMap.put("rate", 1);
						} else {
							jsonMap.put("rate", 0);  //这一路下来的rate好像没什么屌用啊。。
							throw new FileNotFoundException("file write failed:" + fileName);  
						}

					} catch (Exception e) {  
						jsonMap.put("rate", -1);  
						e.printStackTrace();  
					}

				}
			}

		}

		//将微博插入数据库
		String publishDateAndLocation = insertWeiBoIntoDataBase(request, picsMap, videoMap, musicMap);
		if(!publishDateAndLocation.equals(DataDic.DATESTRING)){
			jsonMap.put("publishDate", publishDateAndLocation.substring(0,publishDateAndLocation.indexOf(",")));
			jsonMap.put("location", publishDateAndLocation.substring(publishDateAndLocation.indexOf(",")+1));
			jsonMap.put("picsMap", picsMap);
			jsonMap.put("videoMap", videoMap);
			jsonMap.put("musicMap", musicMap);
			jsonMap.put("rate", 2);
		}

		return jsonMap;

	}


	//保存文件  /**
	/**
	 * 这里  new 了3个文件
	 * @param stream
	 * @param path
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	private File saveFileFromInputStream(InputStream stream, String path,String filename) throws IOException {  
		File savefile = new File(filename);  //用于生成图片，视频等文件
		File dirfile = new File(path);  	//用于生成他们的目录

		//判断路径是否存在  
		if(!dirfile.exists()){
			dirfile.mkdirs();
		}

		File finalFile = new File(path,savefile.getName());  //用于生成保存的文件
		FileOutputStream fs = new FileOutputStream(finalFile);  
		byte[] buffer = new byte[1024 * 1024];  
		int byteread = 0;  
		while ((byteread = stream.read(buffer)) != -1) {  
			fs.write(buffer, 0, byteread);  
			fs.flush();  
		}  
		fs.close();  
		stream.close();  
		return finalFile;  
	}  

	//将发表的微博数据存入数据库
	private String insertWeiBoIntoDataBase(HttpServletRequest request,String picsMap,String videoesMap,String musicMap){
		Map<String,Object> map = new HashMap<String,Object>();

		String txtContent = request.getParameter("content");
		String statue = request.getParameter("statue");
		String userlocation = AddressUtil.getLocation();

		WeiBoUser user = (WeiBoUser)request.getSession().getAttribute("user");

		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=new Date();

		map.put("statue", Integer.parseInt(statue));
		map.put("userlocation", userlocation);
		map.put("publishDate", date);
		map.put("userId", user.getWBUid());
		map.put("weiboTag", null);
		map.put("txtContent", txtContent);
		if(picsMap != null && !picsMap.equals("")){
			map.put("picsMap", picsMap.substring(0, picsMap.length()-1));
		}else{
			map.put("picsMap", null);
		}
		if(videoesMap != null && !videoesMap.equals("")){
			map.put("videoesMap", videoesMap.substring(0, videoesMap.length()-1));
		}else{
			map.put("videoesMap", null);
		}
		if(musicMap != null && !musicMap.equals("")){
			map.put("musicMap", musicMap.substring(0, musicMap.length()-1));
		}else{
			map.put("musicMap", null);
		}
		if(txtContent.contains("[[") && txtContent.contains("]]")){ //这里可能有数组越界的异常
			map.put("weiboTitle", txtContent.substring(txtContent.indexOf("[["), txtContent.indexOf("]]")+2)); //截取标题
		}else{	
			map.put("weiboTitle", null);
		}
		if(txtContent.indexOf("#") != txtContent.lastIndexOf("#")){
			map.put("isThemeWeibo", 'Y');
		}else{
			map.put("isThemeWeibo", 'N');
		}
		System.out.println( "========================================================"+map);
		return weiboService.addWeibo(map) == true ? dateFormater.format(date)+","+userlocation : (DataDic.DATESTRING);
	}
	
	/**
	 * 欢迎页面数据准备
	 */
	@RequestMapping(value="/indexDataPrarery",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getIndexDataPrarery(){
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		
		
		return jsonMap;
	}

} 
