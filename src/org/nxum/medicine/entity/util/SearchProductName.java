package org.nxum.medicine.entity.util;

public class SearchProductName {
	  private  String   productName;
	   private  Integer  page;
	   private  Integer  rows;
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
		return "SearchProductName [productName=" + productName + ", page="
				+ page + ", rows=" + rows + "]";
	}
}
