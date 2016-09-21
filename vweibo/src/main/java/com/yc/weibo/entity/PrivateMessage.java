package com.yc.weibo.entity;

public class PrivateMessage {
	private int pmid;
	private int pm1user;
	private int pm2user;
	private String pmcontent;
	private String pmdate;
	private String UimgPath1;
	private String UimgPath2;
	private String pmread;

	public int getPmid() {
		return pmid;
	}

	public void setPmid(int pmid) {
		this.pmid = pmid;
	}

	public int getPm1user() {
		return pm1user;
	}

	public void setPm1user(int pm1user) {
		this.pm1user = pm1user;
	}

	public int getPm2user() {
		return pm2user;
	}

	public void setPm2user(int pm2user) {
		this.pm2user = pm2user;
	}

	public String getPmcontent() {
		return pmcontent;
	}

	public void setPmcontent(String pmcontent) {
		this.pmcontent = pmcontent;
	}

	public String getPmdate() {
		return pmdate;
	}

	public void setPmdate(String pmdate) {
		this.pmdate = pmdate;
	}

	public String getUimgPath1() {
		return UimgPath1;
	}

	public void setUimgPath1(String uimgPath1) {
		UimgPath1 = uimgPath1;
	}

	public String getUimgPath2() {
		return UimgPath2;
	}

	public void setUimgPath2(String uimgPath2) {
		UimgPath2 = uimgPath2;
	}

	public String getPmread() {
		return pmread;
	}

	public void setPmread(String pmread) {
		this.pmread = pmread;
	}

	public PrivateMessage(int pmid, int pm1user, int pm2user, String pmcontent, String pmdate, String uimgPath1,
			String uimgPath2, String pmread) {
		super();
		this.pmid = pmid;
		this.pm1user = pm1user;
		this.pm2user = pm2user;
		this.pmcontent = pmcontent;
		this.pmdate = pmdate;
		UimgPath1 = uimgPath1;
		UimgPath2 = uimgPath2;
		this.pmread = pmread;
	}

	public PrivateMessage() {
		super();
	}

	@Override
	public String toString() {
		return "PrivateMessage [pmid=" + pmid + ", pm1user=" + pm1user + ", pm2user=" + pm2user + ", pmcontent="
				+ pmcontent + ", pmdate=" + pmdate + ", UimgPath1=" + UimgPath1 + ", UimgPath2=" + UimgPath2
				+ ", pmread=" + pmread + "]";
	}

}
