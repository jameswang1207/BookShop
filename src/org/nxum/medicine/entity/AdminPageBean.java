package org.nxum.medicine.entity;

public class AdminPageBean {
	private Integer page;// 当前页
	private Integer rows;// 每页的记录数
	private Integer pageCount;// 总页数

	public Integer getStart() {
		return (page - 1) * rows;
	}

	public Integer getEnd() {
		return (page * rows) + 1;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
}
