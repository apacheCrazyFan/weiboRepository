package com.yc.weibo.entity;

public class WeiboTag {
	private int WTid;          //--微博标签id
    private String WTname;       //
	public int getWTid() {
		return WTid;
	}
	public void setWTid(int wTid) {
		WTid = wTid;
	}
	public String getWTname() {
		return WTname;
	}
	public void setWTname(String wTname) {
		WTname = wTname;
	}
	@Override
	public String toString() {
		return "WeiboTag [WTid=" + WTid + ", WTname=" + WTname + "]";
	}
    
    
}
