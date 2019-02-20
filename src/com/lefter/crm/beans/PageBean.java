package com.lefter.crm.beans;

import java.util.List;

/**
* @Title: PageBean.java
* @Package com.lefter.crm.beans
* @Description: 分页对象
* @author wuleshen
* @date 2018年8月7日下午3:13:38
* @version V1.0
*/
public class PageBean<T> {
	private int page;			//当前页码
	private int totalRecord;	//总记录数
	private int pageSize;		//每页记录数
	private List<T> beanList;	//当前页的记录对象	
	
	public PageBean() {
		super();
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<T> getBeanList() {
		return beanList;
	}
	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	@Override
	public String toString() {
		return "PageBean [page=" + page + ", totalRecord=" + totalRecord
				+ ", pageSize=" + pageSize + ", beanList=" + beanList + "]";
	}
	
	/*
	 * 计算总页数
	 */
	public int getTotalPage() {
		int totalPage = totalRecord/pageSize;
		return totalPage%pageSize==0 ? totalPage : totalPage+1;
	}

}
