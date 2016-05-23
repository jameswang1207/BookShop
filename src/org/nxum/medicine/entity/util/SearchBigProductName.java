package org.nxum.medicine.entity.util;

public class SearchBigProductName {
    private String  bigProductName;
    private Integer page;
    private Integer rows;
	public String getBigProductName() {
		return bigProductName;
	}
	public void setBigProductName(String bigProductName) {
		this.bigProductName = bigProductName;
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
	@Override
	public String toString() {
		return "SearchBigProductName [bigProductName=" + bigProductName
				+ ", page=" + page + ", rows=" + rows + "]";
	}
    
}
