package com.yc.weibo.entity;

import java.util.Date;

public class Theme {
	private int Tid;					//--话题id
	private String Tname;				//--话题标题
	private String TUid; 				//--话题发起人
	private Date Tdate;					//--话题发起时间
	private String Ttxt;				//--话题的文本内容
	private String Tpics;				//--话题图片路径
	private int Tdeliver;				//--话题被发表的次数
	private int Tview;					//--话题访问次数
	public int getTid() {
		return Tid;
	}
	public void setTid(int tid) {
		Tid = tid;
	}
	public String getTname() {
		return Tname;
	}
	public void setTname(String tname) {
		Tname = tname;
	}
	public String getTUid() {
		return TUid;
	}
	public void setUid(String tuid) {
		TUid = tuid;
	}
	public Date getTdate() {
		return Tdate;
	}
	public void setTdate(Date tdate) {
		Tdate = tdate;
	}
	public String getTtxt() {
		return Ttxt;
	}
	public void setTtxt(String ttxt) {
		Ttxt = ttxt;
	}
	public String getTpics() {
		return Tpics;
	}
	public void setTpics(String tpics) {
		Tpics = tpics;
	}
	public int getTdeliver() {
		return Tdeliver;
	}
	public void setTdeliver(int tdeliver) {
		Tdeliver = tdeliver;
	}
	public int getTview() {
		return Tview;
	}
	public void setTview(int tview) {
		Tview = tview;
	}
	@Override
	public String toString() {
		return "Theme [Tid=" + Tid + ", Tname=" + Tname + ", TUid=" + TUid + ", Tdate=" + Tdate + ", Ttxt=" + Ttxt
				+ ", Tpics=" + Tpics + ", Tdeliver=" + Tdeliver + ", Tview=" + Tview + "]";
	}
	
	
}
