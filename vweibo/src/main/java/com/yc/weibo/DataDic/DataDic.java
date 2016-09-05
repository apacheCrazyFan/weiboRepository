package com.yc.weibo.DataDic;

public class DataDic {				//声音文件  电影    影像 					vivo浏览器加载插件
	public static String VIDEOSUFFIX = "aiff,avi,mov,mpg,mpeg,qt,ram,viv,rmvb,rm,asf,divx,mpe,wmv,mp4,mkv,vob";
															//mac中用到
	public static String PICTURESUFFIX = "BMP,JPG,JPEG,PNG,GIF,TIFF,PSD,SVG,WMF,EMF,LIC,EPS,DXF,TGA,PCX";
									//上面提到的影像文件大多可作为音乐文件
	public static String MUSICSUFFIX = "mp3,wav,mid,tti";
	
	public static final String DENTEDSUFFIX = "exe,bat,com,jsp";
	
	public static final int TOTALSIZE = 1024*1024*1024;   //1G
	
	public static final int SINGLEFILESIZE = 500*1024*1024;  //500M
	
	public static String PICPATH = "/weibopics/";
	
	public static String VIDEOPATH = "/weibovideoes/";
	
	public static String MUSICPATH = "/weibomusics/";
	
	public static String PROJECTNAME = "vweibo";
}