package com.yc.weibo.entity;


/**
 * 这个是用来返回参数给前台的，
 * @author Administrator
 *
 */
public class MessageResp {

	/**
	 * 标志码：1 成功，       0失败
	 */
	private int code;
	
	/**
	 * 返回描述：  成功了，？失败了，
	 */
	private String desc;
	
	/**
	 * 还带有一个参数，可以不用他，
	 */
	private Object obj;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}
	
	
}
