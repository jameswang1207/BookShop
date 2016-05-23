package org.nxum.medicine.entity;

public class PageBean {
	// 当前页通过设置来确定
	private Integer pageNow;
	// 每页显示的条数通过设置来确定
	private Integer pageSize;
	// 共有多好页通过设置来确定
	private Integer pageCount;

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Integer getStart() {
		return (pageNow - 1) * pageSize;
	}

	public Integer getEnd() {
		return (pageNow * pageSize) + 1;
	}

	public Integer getPageNow() {
		return pageNow;
	}

	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}