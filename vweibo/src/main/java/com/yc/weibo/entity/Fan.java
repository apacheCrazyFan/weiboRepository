package com.yc.weibo.entity;

public class Fan {
	private int fuid;
	private int fuedid;
	private String fstatus;
	private int Count;
	private String uname;

	public int getFuid() {
		return fuid;
	}

	public void setFuid(int fuid) {
		this.fuid = fuid;
	}

	public int getFuedid() {
		return fuedid;
	}

	public void setFuedid(int fuedid) {
		this.fuedid = fuedid;
	}

	public String getFstatus() {
		return fstatus;
	}

	public void setFstatus(String fstatus) {
		this.fstatus = fstatus;
	}

	public int getCount() {
		return Count;
	}

	public void setCount(int count) {
		Count = count;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public Fan(int fuid, int fuedid, String fstatus, int count, String uname) {
		super();
		this.fuid = fuid;
		this.fuedid = fuedid;
		this.fstatus = fstatus;
		Count = count;
		this.uname = uname;
	}

	public Fan() {
		super();
	}

	@Override
	public String toString() {
		return "Fan [fuid=" + fuid + ", fuedid=" + fuedid + ", fstatus=" + fstatus + ", Count=" + Count + ", uname="
				+ uname + "]";
	}

}
