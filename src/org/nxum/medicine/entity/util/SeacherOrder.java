package org.nxum.medicine.entity.util;

public class SeacherOrder {
private  Integer  page;
private  Integer  rows;
private  String   orderno;
private  String   truename;
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
public String getOrderno() {
	return orderno;
}
public void setOrderno(String orderno) {
	this.orderno = orderno;
}
public String getTruename() {
	return truename;
}
public void setTruename(String truename) {
	this.truename = truename;
}
@Override
public String toString() {
	return "SeacherOrder [page=" + page + ", rows=" + rows + ", orderno="
			+ orderno + ", truename=" + truename + "]";
}

}
