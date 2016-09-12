package com.yc.weibo.entity;

import java.util.Date;

public class WeiBoUser {
	private Integer WBUid;
	private String Uname;
	private String Upassword;
	private String Uphone;
	private String Uemail;
	private String Usex;
	private int Uage;
	private String UimgPath;
	private Date UregisterDate; 
	private String YZcode;
	private String YZcodeInput;
	private String UserName;
	
	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	//图片水印
	private String waterContent;
	private String waterLocation;
	
	
	//wb添加的
	private int Wcount;	//发起微博数
	private int Tcount;	//发起的话题数
	
	public WeiBoUser() {
	}
	
	public WeiBoUser(String upassword, String uphone) {
		Upassword = upassword;
		Uphone = uphone;
	}


	public WeiBoUser(String upassword,String uemail,int tcount) {
		Tcount = tcount;
		Upassword = upassword;
		Uemail = uemail;
	}


	public WeiBoUser(Integer wBUid, String uname, String upassword, String uphone, String uemail, String usex, int uage,
			String uimgPath, Date uregisterDate, String yZcode, String yZcodeInput, int wcount, int tcount) {
		WBUid = wBUid;
		Uname = uname;
		Upassword = upassword;
		Uphone = uphone;
		Uemail = uemail;
		Usex = usex;
		Uage = uage;
		UimgPath = uimgPath;
		UregisterDate = uregisterDate;
		YZcode = yZcode;
		YZcodeInput = yZcodeInput;
		Wcount = wcount;
		Tcount = tcount;
	}


	
	public String getWaterContent() {
		return waterContent;
	}


	public void setWaterContent(String waterContent) {
		this.waterContent = waterContent;
	}


	public String getWaterLocation() {
		return waterLocation;
	}


	public void setWaterLocation(String waterLocation) {
		this.waterLocation = waterLocation;
	}


	public int getWcount() {
		return Wcount;
	}
	public void setWcount(int wcount) {
		Wcount = wcount;
	}
	public int getTcount() {
		return Tcount;
	}
	public void setTcount(int tcount) {
		Tcount = tcount;
	}
	public Integer getWBUid() {
		return WBUid;
	}
	public void setWUid(Integer wBUid) {
		WBUid = wBUid;
	}
	public String getUname() {
		return Uname;
	}
	public void setUname(String uname) {
		Uname = uname;
	}
	public String getUpassword() {
		return Upassword;
	}
	public void setUpassword(String upassword) {
		Upassword = upassword;
	}
	public String getUphone() {
		return Uphone;
	}
	public void setUphone(String uphone) {
		Uphone = uphone;
	}
	public String getUemail() {
		return Uemail;
	}
	public void setUemail(String uemail) {
		Uemail = uemail;
	}
	public String getUsex() {
		return Usex;
	}
	public void setUsex(String usex) {
		Usex = usex;
	}
	public int getUage() {
		return Uage;
	}
	public void setUage(int uage) {
		Uage = uage;
	}
	public String getUimgPath() {
		return UimgPath;
	}
	public void setUimgPath(String uimgPath) {
		UimgPath = uimgPath;
	}
	public Date getUregisterDate() {
		return UregisterDate;
	}
	public void setUregisterDate(Date uregisterDate) {
		UregisterDate = uregisterDate;
	}
	public String getYZcode() {
		return YZcode;
	}
	public void setYZcode(String yZcode) {
		YZcode = yZcode;
	}
	public String getYZcodeInput() {
		return YZcodeInput;
	}
	public void setYZcodeInput(String yZcodeInput) {
		YZcodeInput = yZcodeInput;
	}
	
	@Override
	public String toString() {
		return "WeiBoUser [WBUid=" + WBUid + ", Uname=" + Uname + ", Upassword=" + Upassword + ", Uphone=" + Uphone
				+ ", Uemail=" + Uemail + ", Usex=" + Usex + ", Uage=" + Uage + ", UimgPath=" + UimgPath
				+ ", UregisterDate=" + UregisterDate + ", YZcode=" + YZcode + ", YZcodeInput=" + YZcodeInput
				+ ", Wcount=" + Wcount + ", Tcount=" + Tcount + "]";
	}
	
	

}
