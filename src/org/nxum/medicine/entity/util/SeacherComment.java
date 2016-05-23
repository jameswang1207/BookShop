package org.nxum.medicine.entity.util;

public class SeacherComment {
 private  Integer  page;
 private  Integer  rows;
 private  String personName;
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
public String getPersonName() {
	return personName;
}
public void setPersonName(String personName) {
	this.personName = personName;
}
@Override
public String toString() {
	return "SeacherComment [page=" + page + ", rows=" + rows + ", personName="
			+ personName + "]";
}
 
}
