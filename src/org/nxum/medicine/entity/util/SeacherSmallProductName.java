package org.nxum.medicine.entity.util;

public class SeacherSmallProductName {
   private String   smallProductName;
   private Integer page;
   private Integer rows;
public String getSmallProductName() {
	return smallProductName;
}
public void setSmallProductName(String smallProductName) {
	this.smallProductName = smallProductName;
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
	return "SeacherSmallProductName [smallProductName=" + smallProductName
			+ ", page=" + page + ", rows=" + rows + "]";
}
   
}
