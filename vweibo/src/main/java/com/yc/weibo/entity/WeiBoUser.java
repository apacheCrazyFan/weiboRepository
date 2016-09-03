package com.yc.weibo.entity;

import java.util.Date;

public class WeiBoUser {
	private Integer WUid;
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
	
	//wb添加的
	private int Wcount;	//发起微博数
	private int Tcount;	//发起的话题数
	
	
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
	public Integer getWUid() {
		return WUid;
	}
	public void setWUid(Integer wUid) {
		WUid = wUid;
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
		return "WeiBoUser [WUid=" + WUid + ", Uname=" + Uname + ", Upassword=" + Upassword + ", Uphone=" + Uphone
				+ ", Uemail=" + Uemail + ", Usex=" + Usex + ", Uage=" + Uage + ", UimgPath=" + UimgPath
				+ ", UregisterDate=" + UregisterDate + ", YZcode=" + YZcode + ", YZcodeInput=" + YZcodeInput
				+ ", Wcount=" + Wcount + ", Tcount=" + Tcount + "]";
	}
	public WeiBoUser(Integer wUid, String uname, String upassword, String uphone, String uemail, String usex, int uage,
			String uimgPath, Date uregisterDate, String yZcode, String yZcodeInput) {
		WUid = wUid;
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
	}
	public WeiBoUser( String uname, String upassword) {
		Uname = uname;
		Upassword = upassword;
	}
	
	
	public WeiBoUser() {
	}
	
	
	

}
