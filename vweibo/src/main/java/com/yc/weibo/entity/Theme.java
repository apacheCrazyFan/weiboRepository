package com.yc.weibo.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Theme extends BaseEntity{
	private WeiBoUser weiBoUser;
	
    private BigDecimal tid;

    private String tname;

    private BigDecimal tuid;

    private Date tdate;

    private String tpics;

    private BigDecimal tdeliver;

    private BigDecimal tview;

    private String ttxt;

    public WeiBoUser getWeiBoUser() {
		return weiBoUser;
	}

	public void setWeiBoUser(WeiBoUser weiBoUser) {
		this.weiBoUser = weiBoUser;
	}

	public BigDecimal getTid() {
        return tid;
    }

    public void setTid(BigDecimal tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public BigDecimal getTuid() {
        return tuid;
    }

    public void setTuid(BigDecimal tuid) {
        this.tuid = tuid;
    }

    public Date getTdate() {
    	return tdate;
    }

    public void setTdate(Date tdate) {
        this.tdate = tdate;
    }

    public String getTpics() {
        return tpics;
    }

    public void setTpics(String tpics) {
        this.tpics = tpics == null ? null : tpics.trim();
    }
    
    public BigDecimal getTdeliver() {
        return tdeliver;
    }

    public void setTdeliver(BigDecimal tdeliver) {
        this.tdeliver = tdeliver;
    }

    public BigDecimal getTview() {
        return tview;
    }

    public void setTview(BigDecimal tview) {
        this.tview = tview;
    }

    public String getTtxt() {
        return ttxt;
    }

    public void setTtxt(String ttxt) {
        this.ttxt = ttxt == null ? null : ttxt.trim();
    }

	@Override
	public String toString() {
		return "Theme [weiBoUser=" + weiBoUser + ", tid=" + tid + ", tname=" + tname + ", tuid=" + tuid + ", tdate="
				+ tdate + ", tpics=" + tpics + ", tdeliver=" + tdeliver + ", tview=" + tview + ", ttxt=" + ttxt + "]";
	}


    
    
}