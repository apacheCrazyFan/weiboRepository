package com.yc.weibo.DataDic;

public class DataDic {				//声音文件  电影    影像 					vivo浏览器加载插件
	public static String VIDEOSUFFIX = "aiff,avi,mov,mpg,mpeg,qt,ram,viv,rmvb,rm,asf,divx,mpe,wmv,mp4,mkv,vob";
															//mac中用到
	public static String PICTURESUFFIX = "BMP,JPG,JPEG,PNG,GIF,TIFF,PSD,SVG,WMF,EMF,LIC,EPS,DXF,TGA,PCX,ico";
									//上面提到的影像文件大多可作为音乐文件
	public static String MUSICSUFFIX = "mp3,wav,mid,tti";
	
	public static final String DENTEDSUFFIX = "exe,bat,com,jsp";
	
	public static final int TOTALSIZE = 1024*1024*1024;   //1G
	
	public static final int SINGLEFILESIZE = 500*1024*1024;  //500M
	
	public static String PICPATH = "/weibopics/";
	
	public static String VIDEOPATH = "/weibovideoes/";
	
	public static String MUSICPATH = "/weibomusics/";
	
	public static String PROJECTNAME = "vweibo";
	
	public static String PROPERTIES = "java.version,java.vendor,java.vendor.url,java.home,java.vm.version,java.vm.vendor,java.vm.name,"
									+ "java.specification.version,java.specification.vendor,java.specification.name,"
									+ "java.class.version,java.class.path,java.library.path,java.io.tmpdir,java.compiler,java.ext.dirs,"
									+ "os.name,os.arch,os.version,file.separator,path.separator,line.separator,user.name,user.home,user.dir";

	public static String DATESTRING = "2088-8-8 8:8:8";
	
	
	//使代码的稳定性更高
	public static final Integer UPLOADSTATUE_FAILED = -1;

	public static final Integer UPLOADSTATUE_FIRST = 0;
	
	public static final Integer UPLOADSTATUE_SECOND = 1;
	
	public static final Integer UPLOADSTATUE_THIRD = 2;

	public static final Integer UPLOADSTATUE_SUCCESS = 3;


	public static String DATABASE = "DB2, Derby, H2, HSQL, Informix, MS-SQL, MySQL, Oracle, PostgreSQL, Sybase, Hana";
	
	//积分
	public static Integer LIKE = 1;   //点赞
	public static Integer COMMENT = 2;//评论
	public static Integer SHARE = 5;  //分享，转发
	public static Integer COLLECT = 6;//收藏

	//表情路径
	public static String FACES = "front/image/face_image/";
}
