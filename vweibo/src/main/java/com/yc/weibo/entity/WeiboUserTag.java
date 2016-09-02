package com.yc.weibo.entity;

public class WeiboUserTag {
	private int UTid;          //--用户标签id
    private String UTname;         // --用户标签名 
    private int UTFid;
	public int getUTid() {
		return UTid;
	}
	public void setUTid(int uTid) {
		UTid = uTid;
	}
	public String getUTname() {
		return UTname;
	}
	public void setUTname(String uTname) {
		UTname = uTname;
	}
	public int getUTFid() {
		return UTFid;
	}
	public void setUTFid(int uTFid) {
		UTFid = uTFid;
	}
	@Override
	public String toString() {
		return "WeiboUserTag [UTid=" + UTid + ", UTname=" + UTname + ", UTFid=" + UTFid + "]";
	}
    
    
}
