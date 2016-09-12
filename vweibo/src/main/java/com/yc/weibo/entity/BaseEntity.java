package com.yc.weibo.entity;

/**
 * 基本类，用来封装了easyui提供的分页参数，并提供了计算分页的 start和end的方法
 * @author Administrator
 *
 */
public class BaseEntity {

	private String order;
	
	private String sort;
	
	private int page;
	
	private int rows;
	
	private int start;
	
	private int end;

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getStart() {
		//进行计算并输出，因为这个方法，调用的时候，已经在mapper里面了，所以page和rows肯定有值了，
		return (this.page-1)*rows;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return this.page*rows;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	
	
	
}
