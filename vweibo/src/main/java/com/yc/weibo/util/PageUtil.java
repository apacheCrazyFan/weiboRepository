package com.yc.weibo.util;

public class PageUtil {
	private int pageNo =1;//当前是第几页
	private int pageSize=15;//每页显示的条数
	private int totalSize; //总条数
	private int totalPages;//总页数
	
	public PageUtil(int pageNo, int pageSize, int totalSize, int totalPages) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalSize = totalSize;
		this.totalPages = totalPages;
	}
	public PageUtil() {

	}


	public int getPageNo() {
		return pageNo;
	}
	
	/**
	 * 第几页
	 * @param pageNo
	 */
	public void setPageNo(int pageNo) {
		if(pageNo<=0){
			this.pageNo=1;
		}else{
			this.pageNo=pageNo;
		}
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	/**
	 * 设置每页显示的条数
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		if(pageSize<=0){
			this.pageSize=2;//设置默认值
		}else{
			this.pageSize = pageSize;
		}
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public int getTotalPages() {
		return this.getTotalSize()%this.getPageSize() ==0 ?this.getTotalSize()/this.getPageSize():this.getTotalSize()/this.getPageSize()+1;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	/**
	 * 上一页
	 * @return
	 */
	public int getProPageNo(){
		int proPageNo=1;
		if(pageNo>1){ //说明还没到首页
			proPageNo=pageNo-1;
		}else{
			proPageNo=1;
		}
		return proPageNo;
	}
	
	/**
	 * 下一页
	 * @return
	 */
	public int getNextPageNo(){
		int nextPageNo=1;
		if(pageNo<this.getTotalPages()){//说明还到最后一页
			nextPageNo=pageNo+1;
		}else{
			nextPageNo=this.getTotalPages();
		}
		return nextPageNo;
	}
}
