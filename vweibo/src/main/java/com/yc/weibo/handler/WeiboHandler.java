package com.yc.weibo.handler;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.yc.weibo.DataDic.DataDic;
import com.yc.weibo.entity.Theme;
import com.yc.weibo.entity.WeiBoUser;
import com.yc.weibo.entity.Weibo;
import com.yc.weibo.service.CommentService;
import com.yc.weibo.service.OperateService;
import com.yc.weibo.service.ThemeService;
import com.yc.weibo.service.UserService;
import com.yc.weibo.service.WeiBoHelpService;
import com.yc.weibo.service.WeiboAndWeiboService;
import com.yc.weibo.service.WeiboService;
import com.yc.weibo.util.AddressUtil;
import com.yc.weibo.util.PageUtil;


@Controller
@RequestMapping("/weibo")
public class WeiboHandler {
	@Autowired 
	private ServletContext servletContext;
	@Autowired
	private OperateService operateService;
	@Autowired
	private WeiboService weiboService;
	@Autowired
	private UserService userService;
	
	@Autowired
	private ThemeService themeService;

	@Autowired
	private WeiboAndWeiboService weiboAndWeiboService;
	@Autowired
	private WeiBoHelpService weiBoHelpService;
	@Autowired
	private CommentService commentService;
	
	@Transactional(propagation=Propagation.REQUIRED)
	@RequestMapping(value="/publish",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> publishWeibo(@RequestParam(name="uid")Integer uid,MultipartHttpServletRequest multipartRequest,HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		System.out.println();
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
						picsMap += originalFilename+",";//总是多一个逗号，
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

		//将微博插入数据库weibo表
		String publishDateAndLocation = insertWeiBoIntoDataBase(request, picsMap, videoMap, musicMap);
		int currWBid = weiboService.selectCurrMaxWBid();
		//将微博插入数据库weibohelp表
		boolean initWeibohelp = weiboService.initWeibohelp(currWBid);
		
		if(!publishDateAndLocation.equals(DataDic.DATESTRING) && initWeibohelp){
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("account", DataDic.PUBLIS);
			params.put("wbuid", uid);
			if(weiboAndWeiboService.insertWeiboAndWeibo(new int[]{currWBid,0}) && userService.updateUserAccount(params)){
				
				System.out.println( "=======================================> 我来了");
				jsonMap.put("wbid", currWBid);
				jsonMap.put("publishDate", publishDateAndLocation.substring(0,publishDateAndLocation.indexOf(",")));
				jsonMap.put("location", publishDateAndLocation.substring(publishDateAndLocation.indexOf(",")+1));
				//增加了最后的逗号删除操作
				jsonMap.put("picsMap", operateString(picsMap));
				jsonMap.put("videoMap", operateString(videoMap));
				jsonMap.put("musicMap", operateString(musicMap));
				jsonMap.put("publishsuccessweiboid", currWBid);
				jsonMap.put("rate", 2);
			}
		}

		return jsonMap;

	}
	
	private String operateString(String str){
		if(!str.equals("")&&str.contains(",")){
			return str.substring(0,str.lastIndexOf(","));
		}
		return str;
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
		
		//如果内容里面有#asdfasdf#  就把 asdfasdf   作为一个话题的标题，
		String regEx = "#[\u4e00-\u9fa5_a-zA-Z0-9]+#"; //中文字母数字
		Pattern pat = Pattern.compile(regEx);
		Matcher mat = pat.matcher(txtContent);
		boolean rs = mat.find();
//		System.out.println(rs);
		
		Theme param=new Theme();
		
		if(rs){
			String themename=mat.group(0);
			System.out.println(mat.group(0));
			param.setTname(themename);
			
			List<Theme> themelist=themeService.findThemeByTname(param);
			if(themelist.isEmpty()){
				param.setTdate(new Date());
				param.setTuid(new BigDecimal(((WeiBoUser)request.getSession().getAttribute("user")).getWBUid()));
				param.setTdeliver(new BigDecimal(0));
				param.setTview(new BigDecimal(0)); 
				
				int result=themeService.addTheme(param);
				if(result<=0){
					//话题添加失败
					return "话题添加失败";
				}
			}else{
				param.setTid(themelist.get(0).getTid());
			}
		}
		
		String statue = request.getParameter("statue");
		String userlocation = AddressUtil.getLocation();

		System.out.println( txtContent + " <----->  "+statue);
		WeiBoUser user = (WeiBoUser)request.getSession().getAttribute("user");

		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=new Date();

		map.put("statue", Integer.parseInt(statue));
		map.put("userLocation", userlocation);
		map.put("publishDate", date);
		map.put("userId", user.getWBUid());
		map.put("weiboTag", null);
		map.put("txtContent", txtContent);
		map.put("isForwarded", 'N');
		map.put("tid", param.getTid());
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
			
			//String[] themes = txtContent.split("#");
			String tname = txtContent.substring(txtContent.indexOf("#"),txtContent.lastIndexOf("#")+1);
			int tid = themeService.selectTidByTname(tname);
			map.put("tid", tid);
			map.put("isThemeWeibo", 'Y');
		}else{
			map.put("isThemeWeibo", 'N');
		}
		System.out.println( "========================================================"+map);
		return weiboService.addWeibo(map) == true ? dateFormater.format(date)+","+userlocation : (DataDic.DATESTRING);
	}
	
	/**
	 * 欢迎页面数据准备 按浏览次数最多的降序
	 */
	@RequestMapping(value="/indexDataPrarery",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getIndexDataPrarery(@RequestParam(name="pageSize")Integer pageSize,@RequestParam(name="pageNum")Integer pageNum){
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		Map<String,Integer> params = new HashMap<String,Integer>();
		
		System.out.println( pageSize+"  =============  "+pageNum);
		params.put("pageSize", pageSize);
		params.put("pageNum", pageNum);
		
		List<Map<String,Object>> weiboList = weiboService.findWeiboOrderByWHviewAccountFirst(params);
		//List<Weibo> weiboList = weiboService.findtWeiboOrderByWHgreateAccount(params);
		System.out.println( weiboList);
		jsonMap.put("weiboList", weiboList);
		jsonMap.put("total", weiboList.size());
		return jsonMap;
	}

	/**
	 * 登录成功后的微博  安最新更新日期排降序
	 * @param pageSize
	 * @param pageNum
	 * @return
	 */
	@Transactional(propagation=Propagation.REQUIRED)  //事务的隔离级别
	@RequestMapping(value="/afterLoginDataPrarery",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getAfterLoginDataPrarery(HttpServletRequest request,@RequestParam(name="pageSize")Integer pageSize,@RequestParam(name="pageNum")Integer pageNum,@RequestParam(name="userid")Integer userid){
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		Map<String,Integer> params = new HashMap<String,Integer>();
		
		HttpSession session=request.getSession();
		PageUtil pages=(PageUtil) session.getAttribute("pageUtil");
		if(pages==null){
			pages=new PageUtil();  
		} 
		params.put("pageSize", pages.getPageSize());
		params.put("pageNum", pages.getPageNo());
		params.put("uid",userid);
		List<Map<String,Object>> weiboList = weiboService.findWeiboOrderByWBdate(params);   //根据日期降序查询微博 
		List<Integer> wbids = operateService.selectIfavoriteWeiboId(userid);  //获得所有我收藏的所有微博id
		int weiboid = weiboService.selectCurrMaxWBid();  //插入微博后的微博id
		
		//根据按日期降序分页查询后的 找出其中是转发微博的 源微博
		Map<Integer,Object> tweiboMap = new HashMap<Integer,Object>();
		
		for(Map<String,Object> weibo : weiboList){
			if( ((String)weibo.get("YON")).indexOf("Y") > -1){  //如果是转发微博

				int wbid = Integer.parseInt(String.valueOf(weibo.get("WBID"))); //得到是转发微博的微博id
				
				int tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(wbid);
				int rootwbid = 0;
				if( tempwbid == 0){
					rootwbid = wbid;
				}else{
					while(tempwbid != 0){
						rootwbid = tempwbid;
						tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(tempwbid);
					}
				}
				
				Map<String,Object> tweibo = weiboService.selectWeiboandweiboHelpById(rootwbid).get(0); //找到要转发的微博所有信息
				tweiboMap.put(wbid, tweibo);
				
			}
		}
		jsonMap.put("tweiboMap", tweiboMap);
		
		jsonMap.put("weiboid", weiboid);
 		jsonMap.put("wbids", wbids);
		jsonMap.put("weiboList", weiboList);
		jsonMap.put("total", weiboList.size());
		
		int count =weiboService.WBTfindCount(new HashMap<String,Object>());
		pages.setTotalSize(count);
		
		session.setAttribute("pageUtil", pages);
		
		return jsonMap;
	}
	
	
	//点赞
	@Transactional(propagation=Propagation.REQUIRED)
	@RequestMapping(value="/addclicklike",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> addClickLike(@RequestParam(name="userid")Integer userid, @RequestParam(name="wbid")Integer wbid,@RequestParam(name="wbuid")Integer wbuid){
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		Map<String,	Object> params = new HashMap<String,Object>();
		
		System.out.println( userid+"  =============  "+wbid + "  ---------  "+wbuid);
		params.put("uid", userid);
		params.put("wbid", wbid);
		params.put("Ostate", "点赞");
		
		int operateId = operateService.selectoperateId(params);
		System.out.println( operateId);
		if(operateId > 0){ //如果该用户已经点赞了
			
			if(weiboService.updateminuWeiboLike(wbid) && operateService.deleteOperate(operateId)){  //删除operate 和 weibohelp的数据
				params.clear();
				params.put("account", -2);
				params.put("wbuid", wbuid);
				
				if(userService.updateUserAccount(params)){  //减少用户的积分
					int greateAccount = weiboService.selectAfterLikeGreateAcount(wbid);  //返回一系列操作后的点赞数
					jsonMap.put("success", true);
					jsonMap.put("greateAccount", greateAccount);
				}
			};
		}else {  //说明以前没有点过赞
			
			if(operateService.insertWhoLikeWeibo(params) && weiboService.updateaddWeiboLike(wbid)){
				params.clear();
				params.put("account", 2);
				params.put("wbuid", wbuid);
				if(userService.updateUserAccount(params)){ //增加用户积分
					int greateAccount = weiboService.selectAfterLikeGreateAcount(wbid);
					jsonMap.put("success", true);
					jsonMap.put("greateAccount", greateAccount);
				}
			}
		}
		return jsonMap;
	}
	
	
	//控制收藏的div的display
	@RequestMapping(value="/collectionDiv",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> collectionDiv(@RequestParam(name="uid")Integer uid, @RequestParam(name="wbid")Integer wbid){
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		Map<String,Object> params = new HashMap<String,Object>();
		
		System.out.println( uid+"  =============  "+wbid);
		params.put("uid", uid);
		params.put("wbid", wbid);
		params.put("Ostate","收藏");
		
		if(operateService.selectoperateId(params) > 0){
			if(weiboService.updateViewOnly(wbid)){
				
				//System.out.println( operateService.selectoperateId(params));
				jsonMap.put("ishave", true);
			}
		}else{
			if(weiboService.updateViewOnly(wbid)){
				//System.out.println( operateService.selectoperateId(params));
				jsonMap.put("ishave", false);
			}
		}
		
		return jsonMap;
	}
	

	//控制评论的div的display
		@RequestMapping(value="/commentDiv",method=RequestMethod.GET)
		@ResponseBody
		public Map<String,Object> commentDiv(@RequestParam(name="wbid")Integer wbid){
			Map<String,Object> jsonMap = new HashMap<String,Object>();
			Map<String,Object> params = new HashMap<String,Object>();
			
			// 根据微博的id查出他的所有评论+回复
			List<Map<String,Object>> commentMsgs = commentService.selectCommentAndWeiboUser(wbid);
			if(commentMsgs != null){
				List<Map<String,Object>> finalCommentMsgs = new ArrayList<Map<String,Object>>();
				Map<String,Object> map = null;
				for(Map<String,Object> commentMsg : commentMsgs){
					map = commentMsg;
					int cid = Integer.parseInt(String.valueOf( commentMsg.get("CSONODE")));
					
					String Ucommented = commentService.selectUnameByCid(cid);
					map.put("UCOMMENTED",Ucommented);
					
					finalCommentMsgs.add(map);
				}
				
				System.out.println(finalCommentMsgs );
				jsonMap.put("success", true);
				jsonMap.put("finalCommentMsgs", finalCommentMsgs);
			}
			
			return jsonMap;
		}
	//收藏
	@Transactional(propagation=Propagation.REQUIRED)
	@RequestMapping(value="/addcollection",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> addcollection(@RequestParam(name="uid")Integer uid, @RequestParam(name="wbid")Integer wbid, @RequestParam(name="txt")String txt,@RequestParam(name="wbuid")Integer wbuid){
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		Map<String,Object> params = new HashMap<String,Object>();
		
		System.out.println( uid+"  =============  "+wbid + " +++++++ "+txt);
		params.put("uid", uid);
		params.put("wbid", wbid);
		params.put("tag",txt);
		
		if(operateService.insertCollectWeibo(params)){  //插入operate
				
				if(weiboService.updateCollectionAccount(wbid)){   //weibohelp的浏览次数和收藏次数加一
					
					params.clear();
					params.put("account", DataDic.COLLECT);
					params.put("wbuid", wbuid);
					//积分更新完成
					if(userService.updateUserAccount(params)){  //跟新微博所属用户的积分
						
						//返回收藏后的收藏数
						int collectionAccount  = weiboService.selectAfterCollection(wbid);
						jsonMap.put("success", true);
						jsonMap.put("collectionAccount", collectionAccount);
					}
				}
			}else{
				
				jsonMap.put("success", false);
			}
			
		return jsonMap;
	}
	
	
	//转发微博
	@Transactional(propagation=Propagation.REQUIRED)
	@RequestMapping(value="/transmitweibo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> transmitweibo(HttpServletRequest request,@RequestParam(name="uid")Integer uid, @RequestParam(name="wbid")Integer wbid, @RequestParam(name="txt")String txt,@RequestParam(name="wbuid")Integer wbuid){
		HttpSession session = request.getSession();
		WeiBoUser user = (WeiBoUser) session.getAttribute("user");
		//System.out.println( user );
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		Map<String,Object> params = new HashMap<String,Object>();
		
		System.out.println( uid+"  =============  "+wbid + " +++++++ "+txt);

		String userLocation = AddressUtil.getLocation(); 
		
		Date date=new Date();
		//首先查找是否是转发微博
		if(weiboService.selectTransmityon(wbid).indexOf("N") > -1){ //不是，直接转发
			System.out.println( "本身就是源微博");

			
			if(txt.contains("[[") && txt.contains("]]")){ //这里可能有数组越界的异常
				params.put("weiboTitle", txt.substring(txt.indexOf("[["), txt.indexOf("]]")+2)); //截取标题
			}else{	
				params.put("weiboTitle", null);
			}
			if(txt.indexOf("#") != txt.lastIndexOf("#")){
				String tname = txt.substring(txt.indexOf("#"),txt.lastIndexOf("#")+1);
				int tid = themeService.selectTidByTname(tname);
				params.put("tid", tid);
				params.put("isThemeWeibo", 'Y');
			}else{
				params.put("isThemeWeibo", 'N');
			}
			
			params.put("userLocation", userLocation);
			params.put("transmitDate", date);
			params.put("userId", user.getWBUid());
			params.put("txtContent", txt);
			if(weiboService.insertWeiboByTransmit(params)){  //如果插入了weibo表
				int currWBid = weiboService.selectCurrMaxWBid();
				//将微博插入数据库weibohelp表
				if(weiboService.initWeibohelp(currWBid)){ //如果也插入了weiboHelp表
					
					params.clear();
					params.put("uid", uid);
					params.put("wbid", wbid);
					params.put("txt",txt);
					
					if(weiboAndWeiboService.insertWeiboAndWeibo(new int[]{currWBid, wbid}) && operateService.insertTransmitWeibo(params)){  //如果转发插入operate表成功  这里要注意weibo表和operate表中都有txt 也就是转发的理由 文本内容
						
						if(weiboService.updateTransmitAccount(wbid)){
							params.clear();
							params.put("account", DataDic.SHARE);
							params.put("wbuid", wbuid);
						
							if(userService.updateUserAccount(params)){  //用户积分更新成功
								params.clear();
								params.put("account", DataDic.PUBLIS);
								params.put("wbuid", uid);
								
								if(userService.updateUserAccount(params)){  //用户积分更新成功
									int originTransmitAccount = weiBoHelpService.selectWBreprintaccountOnly(wbid);
									int currTransmitAccount = weiBoHelpService.selectWBreprintaccountOnly(wbid);
									List<Map<String,Object>> weibo = weiboService.selectWeiboandweiboHelpById(wbid); //找到要转发的微博所有信息
								
									jsonMap.put("userLocation", userLocation);
									jsonMap.put("currWBid", currWBid);
									jsonMap.put("weibo", weibo);
									jsonMap.put("originTransmitAccount", originTransmitAccount);
									jsonMap.put("currTransmitAccount",currTransmitAccount);
								
									jsonMap.put("success", true);
								}
							}
						}
					}
				}
			}
			
			
		}else{  //否则说明  转发的微博 是 转发微博，找到根微博
			System.out.println( "本身就不是源微博");
			int tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(wbid);
			int rootwbid = 0;
			if( tempwbid == 0){
				rootwbid = wbid;
			}else{
				while(tempwbid != 0){
					rootwbid = tempwbid;
					tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(tempwbid);
				}
			}
			
			if(txt.contains("[[") && txt.contains("]]")){ //这里可能有数组越界的异常
				params.put("weiboTitle", txt.substring(txt.indexOf("[["), txt.indexOf("]]")+2)); //截取标题
			}else{	
				params.put("weiboTitle", null);
			}
			if(txt.indexOf("#") != txt.lastIndexOf("#")){
				String tname = txt.substring(txt.indexOf("#"),txt.lastIndexOf("#")+1);
				int tid = themeService.selectTidByTname(tname);
				params.put("tid", tid);
				params.put("isThemeWeibo", 'Y');
			}else{
				params.put("isThemeWeibo", 'N');
			}
			
			params.put("userLocation", userLocation);
			params.put("transmitDate", date);
			params.put("userId", user.getWBUid());
			params.put("txtContent", txt);
			if(weiboService.insertWeiboByTransmit(params)){  //如果插入了weibo表
				int currWBid = weiboService.selectCurrMaxWBid();
				//将微博插入数据库weibohelp表
				if(weiboService.initWeibohelp(currWBid)){ //如果也插入了weiboHelp表
					
					params.clear();
					params.put("uid", uid);
					params.put("wbid", wbid);
					params.put("txt",txt);
					
					if(weiboAndWeiboService.insertWeiboAndWeibo(new int[]{currWBid, wbid}) && operateService.insertTransmitWeibo(params)){  //如果转发插入operate表成功  这里要注意weibo表和operate表中都有txt 也就是转发的理由 文本内容
						
						if(weiboService.updateTransmitAccount(wbid) && weiboService.updateTransmitAccount(rootwbid)){
							params.clear();
							params.put("account", DataDic.SHARE);
							params.put("wbuid", wbuid);
						
							if(userService.updateUserAccount(params)){
								params.clear();
								params.put("account", DataDic.SHARE);
								params.put("wbuid", uid);
								if(userService.updateUserAccount(params)){
									
									int wboid = weiboService.selectWBUidByWbid(rootwbid);
									params.clear();
									params.put("account", DataDic.PUBLIS);
									params.put("wbuid", wboid);
								
									if(userService.updateUserAccount(params)){
									
										int originTransmitAccount = weiBoHelpService.selectWBreprintaccountOnly(rootwbid);
										int currTransmitAccount = weiBoHelpService.selectWBreprintaccountOnly(wbid);
										List<Map<String,Object>> weibo = weiboService.selectWeiboandweiboHelpById(rootwbid); //找到要转发的根微博所有信息
								
										jsonMap.put("userLocation", userLocation);
										jsonMap.put("currWBid", currWBid);
										jsonMap.put("weibo", weibo);
										jsonMap.put("originTransmitAccount", originTransmitAccount);
										jsonMap.put("currTransmitAccount",currTransmitAccount);
								
										jsonMap.put("success", true);
									}
								}
							}
						}
					}
				}
			}
		}
		
		return jsonMap;
	}
	
	
		//评论回复（直接回复）
		@Transactional(propagation=Propagation.REQUIRED)
		@RequestMapping(value="/commentweibo",method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> commentweibo(@RequestParam(name="uid")Integer uid, @RequestParam(name="wbid")Integer wbid, @RequestParam(name="txt")String txt,@RequestParam(name="ischeck")boolean ischeck){
			Map<String,Object> jsonMap = new HashMap<String,Object>();
			Map<String,Object> params = new HashMap<String,Object>();
			
			System.out.println( uid+"  =============  "+wbid + " +++++++ "+txt+"  ++++++++ "+ischeck);
			SimpleDateFormat sdf = new SimpleDateFormat("MM月dd HH:mm:ss");
			Date date = new Date();
			String commentdate = sdf.format(date);

			if(!ischeck){ // 不用转发到我的微博"
				params.clear();
				params.put("uid", uid);
				params.put("wbid", wbid);
				params.put("txt",txt);
				if(commentService.insertCommentDirect(params) && operateService.insertCommentWeibo(params)){  //插入评论表  he 操作表 成功
					
					if(weiboService.selectTransmityon(wbid).indexOf("N") > -1){ //是否本事就是源微博  是
						System.out.println( "shi yuan wei bo");
						if(weiboService.updateCommentAccount(wbid)){  //跟新浏览次数及评论次数
							int wbuid = weiboService.selectWBUidByWbid(wbid);
							//更新用户积分
							params.clear();
							params.put("account", DataDic.COMMENT);
							params.put("wbuid", wbuid);
							
							if(userService.updateUserAccount(params)){ //跟新用户积分
								int CommentAccount = weiboService.selectAfterComment(wbid);
								int currCid = commentService.selectCurrCommentId();
								jsonMap.put("currCid", currCid);
								jsonMap.put("commentDate", commentdate);
								jsonMap.put("success", true);
								jsonMap.put("flag", false);  //返回  确定到底是不是要转发微博
								jsonMap.put("commentAccount", CommentAccount);
							}
						}
					}else{  //不是源微博
						//找到原微博
						System.out.println( "bushi yuan weibo");
						int tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(wbid);
						int rootwbid = 0;
						if( tempwbid == 0){
							rootwbid = wbid;
						}else{
							while(tempwbid != 0){
								rootwbid = tempwbid;
								tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(tempwbid);
							}
						}
						if(weiboService.updateCommentAccount(wbid) && weiboService.updateViewOnly(rootwbid)){  //跟新浏览次数及评论次数
							int wbuid = weiboService.selectWBUidByWbid(wbid);
							//更新用户积分
							params.clear();
							params.put("account", DataDic.COMMENT);
							params.put("wbuid", wbuid);
							
							if(userService.updateUserAccount(params)){ //跟新所属微博用户积分
								int CommentAccount = weiboService.selectAfterComment(wbid);
								int currCid = commentService.selectCurrCommentId();
								jsonMap.put("currCid", currCid);
								jsonMap.put("commentAccount", CommentAccount);
								jsonMap.put("commentDate", commentdate);
								jsonMap.put("success", true);
								jsonMap.put("flag", false);  //返回  确定到底是不是要转发微博
							}
						}
						
					}
				}
				
			}else{ //要转发到我的微博   已知用户id  微博id 转发的理由
				System.out.println( "评论转发");
				String userLocation = AddressUtil.getLocation(); 
				
				//首先查找是否是转发微博
				if(weiboService.selectTransmityon(wbid).indexOf("N") > -1){ //不是，直接转发
					params.put("userLocation", userLocation);
					params.put("transmitDate", date);
					params.put("userId", uid);
					params.put("txtContent", txt);
					
					if(weiboService.insertWeiboByTransmit(params)){  //如果插入了weibo表
						int currWBid = weiboService.selectCurrMaxWBid();
						//将微博插入数据库weibohelp表
						if(weiboService.initWeibohelp(currWBid)){ //如果也插入了weiboHelp表
							params.clear();
							params.put("uid", uid);
							params.put("wbid", wbid);
							params.put("txt",txt);
							if(weiboAndWeiboService.insertWeiboAndWeibo(new int[]{currWBid, wbid}) && operateService.insertTransmitWeibo(params) && operateService.insertCommentWeibo(params)){  //如果转发插入operate表成功  这里要注意weibo表和operate表中都有txt 也就是转发的理由 文本内容
								if(weiboService.updateTransmitAccount(wbid) && weiboService.updateCommentAccount(wbid)){
									int wbuid = weiboService.selectWBUidByWbid(wbid);
									params.clear();
									params.put("account", DataDic.SHARE+DataDic.COMMENT); 
									params.put("wbuid", wbuid);
								
									if(userService.updateUserAccount(params)){  //用户积分更新成功
										params.clear();
										params.put("account", DataDic.PUBLIS);
										params.put("wbuid", uid);
										if(userService.updateUserAccount(params)){
											int originTransmitAccount = weiBoHelpService.selectWBreprintaccountOnly(wbid);
											int currTransmitAccount = weiBoHelpService.selectWBreprintaccountOnly(wbid);
											List<Map<String,Object>> weibo = weiboService.selectWeiboandweiboHelpById(wbid); //找到要转发的微博所有信息
										
											int CommentAccount = weiboService.selectAfterComment(wbid);
											int currCid = commentService.selectCurrCommentId();
											jsonMap.put("currCid", currCid);
											jsonMap.put("commentDate", commentdate);
											jsonMap.put("commentAccount", CommentAccount);
											jsonMap.put("success", true);
											jsonMap.put("flag", true);  //返回  确定到底是不是要转发微博
											jsonMap.put("userLocation", userLocation);
											jsonMap.put("currWBid", currWBid);   //成功插入weibo表后的微博id
											jsonMap.put("weibo", weibo);
											jsonMap.put("originTransmitAccount", originTransmitAccount);
											jsonMap.put("currTransmitAccount",currTransmitAccount);
										
										}
									}
								}
							}
						}
						
					}
					
				}else{ //是转发后的原微博
					int tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(wbid);
					int rootwbid = 0;
					if( tempwbid == 0){
						rootwbid = wbid;
					}else{
						while(tempwbid != 0){
							rootwbid = tempwbid;
							tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(tempwbid);
						}
					}
					
					params.put("userLocation", userLocation);
					params.put("transmitDate", date);
					params.put("userId", uid);
					params.put("txtContent", txt);
					if(weiboService.insertWeiboByTransmit(params)){  //如果插入了weibo表
						//已知用户id <> uid  微博id <> wbid 转发的理由 <> txt
						int currWBid = weiboService.selectCurrMaxWBid();
						//将微博插入数据库weibohelp表
						if(weiboService.initWeibohelp(currWBid)){ //如果也插入了weiboHelp表
							
							params.clear();
							params.put("uid", uid);
							params.put("wbid", wbid);
							params.put("txt",txt);
							
							if(weiboAndWeiboService.insertWeiboAndWeibo(new int[]{currWBid, wbid}) && operateService.insertTransmitWeibo(params) && operateService.insertCommentWeibo(params)){  //如果转发插入operate表成功  这里要注意weibo表和operate表中都有txt 也就是转发的理由 文本内容
								if(weiboService.updateTransmitAccount(wbid) && weiboService.updateCommentAccount(wbid) && weiboService.updateTransmitAccount(rootwbid)){
									int wbuid = weiboService.selectWBUidByWbid(wbid);
									params.clear();
									params.put("account", DataDic.SHARE);
									params.put("wbuid", wbuid);
									if(userService.updateUserAccount(params)){  //更新微博所属用户的积分
										int wboid = weiboService.selectWBUidByWbid(rootwbid);
										params.clear();
										params.put("account", DataDic.SHARE);
										params.put("wbuid", wboid);
										if(userService.updateUserAccount(params)){ //更新原微博所属用户的积分
											params.clear();
											params.put("account", DataDic.PUBLIS);
											params.put("wbuid", uid);
											if(userService.updateUserAccount(params)){ //更新当前用户的积分
												int originTransmitAccount = weiBoHelpService.selectWBreprintaccountOnly(wbid);
												int currTransmitAccount = weiBoHelpService.selectWBreprintaccountOnly(wbid);
												List<Map<String,Object>> weibo = weiboService.selectWeiboandweiboHelpById(rootwbid); //找到要转发的微博所有信息
											
												int CommentAccount = weiboService.selectAfterComment(wbid);
												int currCid = commentService.selectCurrCommentId();
												jsonMap.put("currCid", currCid);
												jsonMap.put("commentDate", commentdate);
												jsonMap.put("commentAccount", CommentAccount);
												jsonMap.put("success", true);
												jsonMap.put("flag", true);  //返回  确定到底是不是要转发微博
												jsonMap.put("userLocation", userLocation);
												jsonMap.put("currWBid", currWBid);
												jsonMap.put("weibo", weibo);
												jsonMap.put("originTransmitAccount", originTransmitAccount);
												jsonMap.put("currTransmitAccount",currTransmitAccount);
											}
										}
									}
								}
							}
						}
					}
				}
			}
			
			return jsonMap;
		}
		
	//评论评论的评论
	@Transactional(propagation=Propagation.REQUIRED)
	@RequestMapping(value="/commentAndComment",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> commentAndComment(@RequestParam(name="uid")Integer uid, @RequestParam(name="wbid")Integer wbid, @RequestParam(name="txt")String txt,@RequestParam(name="cid")Integer cid){
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		Map<String,Object> params = new HashMap<String,Object>();
		
		System.out.println( uid+"  =============  "+wbid + " +++++++ "+txt+"  ++++++++ "+cid);
		SimpleDateFormat sdf = new SimpleDateFormat("MM月dd HH:mm:ss");
		Date date = new Date();
		String commentdate = sdf.format(date);
		
		params.clear();
		params.put("uid", uid);
		params.put("wbid", wbid);
		params.put("txt",txt);
		if(operateService.insertCommentWeibo(params)){  //插入操作表 成功
			params.put("cid", cid);
			if(commentService.insertCommentByComment(params)){ //插入评论表成功
			
				if(weiboService.selectTransmityon(wbid).indexOf("N") > -1){ //是否本事就是源微博  是
					System.out.println( "ping lun de ping lun --");
					if(weiboService.updateCommentAccount(wbid)){  //跟新浏览次数及评论次数
							int wbuid = weiboService.selectWBUidByWbid(wbid);
							//更新用户积分
							params.clear();
							params.put("account", DataDic.COMMENT);
							params.put("wbuid", wbuid);
					
							if(userService.updateUserAccount(params)){ //跟新用户积分
								int CommentAccount = weiboService.selectAfterComment(wbid);
								int currCid = commentService.selectCurrCommentId();
								String commentUname = commentService.selectUnameByCid(cid);
								jsonMap.put("commentUname", commentUname);
								jsonMap.put("currCid", currCid);
								jsonMap.put("commentDate", commentdate);
								jsonMap.put("success", true);
								jsonMap.put("commentAccount", CommentAccount);
							}
					}
				}else{  //不是源微博
					//找到原微博
					System.out.println( "bushi yuan weibo + ping lun de ping lun --");
					int tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(wbid);
					int rootwbid = 0;
					if( tempwbid == 0){
						rootwbid = wbid;
					}else{
						while(tempwbid != 0){
							rootwbid = tempwbid;
							tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(tempwbid);
						}
					}
					
					if(weiboService.updateCommentAccount(wbid) && weiboService.updateViewOnly(rootwbid)){  //跟新浏览次数及评论次数
						int wbuid = weiboService.selectWBUidByWbid(wbid);
						//更新用户积分
						params.clear();
						params.put("account", DataDic.COMMENT);
						params.put("wbuid", wbuid);
					
						if(userService.updateUserAccount(params)){ //跟新所属微博用户积分
							int CommentAccount = weiboService.selectAfterComment(wbid);
							int currCid = commentService.selectCurrCommentId();
							String commentUname = commentService.selectUnameByCid(cid);
							jsonMap.put("commentUname", commentUname);
							jsonMap.put("currCid", currCid);
							jsonMap.put("commentAccount", CommentAccount);
							jsonMap.put("commentDate", commentdate);
							jsonMap.put("success", true);
						}
					}
				}
			}
		}
		return jsonMap;
		
	}
	
	
	//热门微博
	@RequestMapping(value="/findHotWeiBo",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> findHotWeiBo(@RequestParam(name="pageSize")Integer pageSize,@RequestParam(name="pageNum")Integer pageNum,@RequestParam(name="userid")Integer userid){
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		Map<String,Integer> params = new HashMap<String,Integer>();
		
		params.put("pageSize", pageSize);
		params.put("pageNum", pageNum);
		params.put("uid",userid);
		List<Map<String,Object>> weiboList = weiboService.findHotWeiBo(params);   
		List<Integer> wbids = operateService.selectIfavoriteWeiboId(userid);  //获得所有我收藏的所有微博id
		int weiboid = weiboService.selectCurrMaxWBid();  //插入微博后的微博id
		
		jsonMap.put("weiboid", weiboid);
 		jsonMap.put("wbids", wbids);
		jsonMap.put("weiboList", weiboList);
		jsonMap.put("total", weiboList.size());
		
		return jsonMap;
	}
	
	
	//好友圈
	@RequestMapping(value="/findFriendWeiBo",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> findFriendWeiBo(@RequestParam(name="WBUid")Integer WBUid,@RequestParam(name="pageSize")Integer pageSize,@RequestParam(name="pageNum")Integer pageNum){
		System.out.println( WBUid+"  =============  "+pageNum);
		Map<String,Object> jsonMap = new HashMap<String,Object>();

		Map<String,Integer> params = new HashMap<String,Integer>();

		params.put("pageSize", pageSize);
		params.put("pageNum", pageNum);
		params.put("WBUid", WBUid);
		List<Map<String,Object>> weiboList = weiboService.findFriendWeiBo(params);

		System.out.println( weiboList);
		jsonMap.put("weiboList", weiboList);
		jsonMap.put("total", weiboList.size());
		return jsonMap;
		}
	
	//我的收藏
	@RequestMapping(value="/myCollections",method=RequestMethod.POST)
	public void myCollections(int WBUid,PrintWriter out){
		Gson gson=new Gson();
		List<Weibo> weibos=weiboService.myCollections(WBUid);
		System.out.print(weibos);
		out.print(gson.toJson(weibos));
		out.flush();
		out.close();
	}
	
	@ResponseBody
	@RequestMapping({"findWeiboByTid"})
	public Map<String,Object> findWeiboByTid(String tid,HttpServletRequest request,HttpServletResponse response){
		//TODO:封装成easyui可以识别的json格式
		List<Weibo> list=weiboService.findWeiBoByTid(Integer.parseInt(tid));
		int total=weiboService.WBTfindCount(new HashMap<String,Object>());
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("rows", list);
		map.put("total",total);
		return map;
	}
	
	
	/**
	 *  根据分页的情况，查询微博
	 * @param weibo
	 * @param  op:"nextPage",pageNo:''
	 * @return
	 */
	@ResponseBody
	@RequestMapping({"findWeiboByPage"})//因为这里传了pageNo=‘’的情况，所以还是用String的吧，，
	public Map<String,Object> findWeiboByPage(String userid,String op,String pageNo,HttpServletRequest request,HttpServletResponse response){
//		Map<String,Object> params = new HashMap<String,Object>();
		
		
		HttpSession session=request.getSession();
		PageUtil pages=(PageUtil) session.getAttribute("pageUtil");
		if(pages==null){
			pages=new PageUtil();  //正常情况下，这里的pages是直接从session中拿取的，不需要new
		} 
		//判断 是 上一页，   下一页   ，还是跳转到页面，
		if(op.equals("")){
			//跳转页面
			pages.setPageNo(Integer.parseInt(pageNo));
		}else if(op.equals("prePage")){
			//前一页
			pages.setPageNo(pages.getProPageNo());//设置为上一页，然后pageSize不变
		}else{
			//后一页
			pages.setPageNo(pages.getNextPageNo());//设置为xia一页，然后pageSize不变
		}
		//至此，页面的信息已经维护好了，现在只要到service里面查询了，
		
//		params.put("start", pages.getPageSize()*(pages.getPageNo()-1));
//		params.put("end", pages.getPageNo()*pages.getPageSize());
//		List<Weibo> weiboList = weiboService.findWeiboByPage(params);   //根据日期降序查询微博 
		
		Map<String,Integer> params=new HashMap<String,Integer>();
		
		params.put("pageSize", pages.getPageSize());
		params.put("pageNum", pages.getPageNo());
		params.put("uid",Integer.parseInt(userid));
		List<Map<String,Object>> weiboList = weiboService.findWeiboOrderByWBdate(params);
		
		List<Integer> wbids = operateService.selectIfavoriteWeiboId(Integer.parseInt(userid));  //获得所有我收藏的所有微博id
		int weiboid = weiboService.selectCurrMaxWBid();  //插入微博后的微博id
		
		//根据按日期降序分页查询后的 找出其中是转发微博的 源微博
		Map<Integer,Object> tweiboMap = new HashMap<Integer,Object>();
		
		for(Map<String,Object> weibo : weiboList){
			if( ((String)weibo.get("YON")).indexOf("Y") > -1){  //如果是转发微博

				int wbid = Integer.parseInt(String.valueOf(weibo.get("WBID"))); //得到是转发微博的微博id
				
				int tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(wbid);
				int rootwbid = 0;
				if( tempwbid == 0){
					rootwbid = wbid;
				}else{
					while(tempwbid != 0){
						rootwbid = tempwbid;
						tempwbid = weiboAndWeiboService.selectWeiboAndWeibo(tempwbid);
					}
				}
				
				Map<String,Object> tweibo = weiboService.selectWeiboandweiboHelpById(rootwbid).get(0); //找到要转发的微博所有信息
				tweiboMap.put(wbid, tweibo);
				
			}
		}
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		jsonMap.put("tweiboMap", tweiboMap);
		
		jsonMap.put("weiboid", weiboid);
 		jsonMap.put("wbids", wbids);
		jsonMap.put("weiboList", weiboList);
		jsonMap.put("total", weiboList.size());
		
		int count =weiboService.WBTfindCount(new HashMap<String,Object>());
		pages.setTotalSize(count);
		
		session.setAttribute("pageUtil", pages);
		
		return jsonMap;
	}
	
	//我的赞
	@RequestMapping(value="/findMyZan",method=RequestMethod.POST)
	public void findMyZan(int WBUid,PrintWriter out){
		Gson gson=new Gson();
		List<Weibo> weibos=weiboService.findMyZan(WBUid);
		System.out.print(weibos);
		out.print(gson.toJson(weibos));
		out.flush();
		out.close();
	}
	
	//分类浏览
	@ResponseBody
	@RequestMapping(value="/findWeiBoByWBtag",method=RequestMethod.GET)
	public Map<String,Object> findWeiBoByWBtag(@RequestParam(name="pageSize")String pageSize,@RequestParam(name="pageNum")String pageNum,@RequestParam("wbtag")String wbtag,Integer userid){
		try {
			wbtag=URLDecoder.decode(wbtag,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println( pageSize+"  =============  "+pageNum+"---"+wbtag);
		Map<String,Object> jsonMap = new HashMap<String,Object>();

		Map<String,Object> params = new HashMap<String,Object>();
		String searchText = new StringBuilder("%").append(wbtag).append("%").toString();
		params.put("pageSize", pageSize);
		params.put("pageNum", pageNum);
		params.put("wbtag", searchText);
		List<Map<String,Object>> weiboList = weiboService.findWeiBoByWBtag(params);
		System.out.println(weiboList);
		List<Integer> wbids = operateService.selectIfavoriteWeiboId(userid);  //获得所有我收藏的所有微博id
		int weiboid = weiboService.selectCurrMaxWBid();  //插入微博后的微博id
		
		jsonMap.put("weiboid", weiboid);
 		jsonMap.put("wbids", wbids);
		jsonMap.put("weiboList", weiboList);
		jsonMap.put("total", weiboList.size());
		
		return jsonMap;
		}
	
	
		//我的首页
		@RequestMapping(value="/findpersonal",method=RequestMethod.POST)
		public void findpersonal(int WBUid,PrintWriter out){
			Gson gson=new Gson();
			List<Weibo> weibos=weiboService.findpersonal(WBUid);
			System.out.print(weibos);
			out.print(gson.toJson(weibos));
			out.flush();
			out.close();
		}
		
		//好友圈
		@RequestMapping(value="/findGroupWeiBo",method=RequestMethod.GET)
		@ResponseBody
		public Map<String,Object> findGroupWeiBo(@RequestParam(name="WBUid")Integer WBUid,@RequestParam(name="pageSize")Integer pageSize,@RequestParam(name="pageNum")Integer pageNum){
			Map<String,Object> jsonMap = new HashMap<String,Object>();
			Map<String,Integer> params = new HashMap<String,Integer>();
			
			params.put("pageSize", pageSize);
			params.put("pageNum", pageNum);
			params.put("WBUid",WBUid);
			List<Map<String,Object>> weiboList = weiboService.findGroupWeiBo(params);   
			List<Integer> wbids = operateService.selectIfavoriteWeiboId(WBUid);  //获得所有我收藏的所有微博id
			int weiboid = weiboService.selectCurrMaxWBid();  //插入微博后的微博id
			
			jsonMap.put("weiboid", weiboid);
	 		jsonMap.put("wbids", wbids);
			jsonMap.put("weiboList", weiboList);
			jsonMap.put("total", weiboList.size());
			
			return jsonMap;
		}
		
	/*特别关心*/
		//好友圈
		@RequestMapping(value="/findMoreAttentionWeiBo",method=RequestMethod.GET)
		@ResponseBody
		public Map<String,Object> findMoreAttentionWeiBo(@RequestParam(name="WBUid")Integer WBUid,@RequestParam(name="pageSize")Integer pageSize,@RequestParam(name="pageNum")Integer pageNum){
			System.out.println( WBUid+"  =============  "+pageNum);
			Map<String,Object> jsonMap = new HashMap<String,Object>();

			Map<String,Integer> params = new HashMap<String,Integer>();

			params.put("pageSize", pageSize);
			params.put("pageNum", pageNum);
			params.put("WBUid", WBUid);
			List<Map<String,Object>> weiboList = weiboService.findMoreAttentionWeiBo(params);

			System.out.println( weiboList);
			jsonMap.put("weiboList", weiboList);
			jsonMap.put("total", weiboList.size());
			return jsonMap;
			}
		
		//我的相册
		@RequestMapping(value="/findMyPhoto",method=RequestMethod.POST)
		public void findMyPhoto(Integer WBUid,PrintWriter out){
			Gson gson=new Gson();
			List<Weibo> weibos=weiboService.findMyPhoto(WBUid);
			System.out.print(weibos);
			out.print(gson.toJson(weibos));
			out.flush();
			out.close();
		}
		
		//我的粉丝
		@RequestMapping(value="/findMyFans",method=RequestMethod.POST)
		public void findMyFans(Integer WBUid,PrintWriter out){
			Gson gson=new Gson();
			List<WeiBoUser> myFans=weiboService.findMyFans(WBUid);
			System.out.print(myFans);
			out.print(gson.toJson(myFans));
			out.flush();
			out.close();
		}
} 
