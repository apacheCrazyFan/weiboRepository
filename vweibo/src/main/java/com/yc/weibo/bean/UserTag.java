package com.yc.weibo.bean;

public class UserTag {
	private int UTid;         // --用户标签id
    private String UTname;       //   --用户标签名 
    
    
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
	@Override
	public String toString() {
		return "UserTag [UTid=" + UTid + ", UTname=" + UTname + "]";
	}
    
    
}
