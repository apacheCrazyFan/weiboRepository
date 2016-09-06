package com.yc.weibo.entity;


import java.util.Date;

public class Weibo {
	 private int WBid;          //--微博id
     private String WBtag;      //--微博标签（）
     private String WBtitle;    //--微博标题（可以写，也可以不写，但必须有）
     private int UId;			//--用户id（发表者）
     private Date WBdate;       //--微博发表日期
     private String WBtxt;      //-微博文字内容
     private String WBpic;   	//--微博图片路径
     private String WBvideo; 	//	--可能存在的视频路径
     private String WBmusic;	//可能存在的音乐路径
     
     private boolean yesOrno;	//是否是话题产生的
     private String WBlocation;
     
     
	
	public String getWBlocation() {
		return WBlocation;
	}
	public void setWBlocation(String wBlocation) {
		WBlocation = wBlocation;
	}
	public boolean isYesOrno() {
		return yesOrno;
	}
	public void setYesOrno(boolean yesOrno) {
		this.yesOrno = yesOrno;
	}
	public int getWBid() {
		return WBid;
	}
	public void setWBid(int wBid) {
		WBid = wBid;
	}
	public String getWBtag() {
		return WBtag;
	}
	public void setWBtag(String wBtag) {
		WBtag = wBtag;
	}
	public String getWBtitle() {
		return WBtitle;
	}
	public void setWBtitle(String wBtitle) {
		WBtitle = wBtitle;
	}
	public int getUId() {
		return UId;
	}
	public void setUId(int uId) {
		UId = uId;
	}
	public Date getWBdate() {
		return WBdate;
	}
	public void setWBdate(Date wBdate) {
		WBdate = wBdate;
	}
	public String getWBtxt() {
		return WBtxt;
	}
	public void setWBtxt(String wBtxt) {
		WBtxt = wBtxt;
	}
	public String getWBpic() {
		return WBpic;
	}
	public void setWBpic(String wBpic) {
		WBpic = wBpic;
	}
	public String getWBvideo() {
		return WBvideo;
	}
	public void setWBvideo(String wBvideo) {
		WBvideo = wBvideo;
	}
	public String getWBmusic() {
		return WBmusic;
	}
	public void setWBmusic(String wBmusic) {
		WBmusic = wBmusic;
	}
	@Override
	public String toString() {
		return "Weibo [WBid=" + WBid + ", WBtag=" + WBtag + ", WBtitle=" + WBtitle + ", UId=" + UId + ", WBdate="
				+ WBdate + ", WBtxt=" + WBtxt + ", WBpic=" + WBpic + ", WBvideo=" + WBvideo + ", WBmusic=" + WBmusic
				+ ", yesOrno=" + yesOrno + "]";
	}
	
	
     
     
}
