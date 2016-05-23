package org.nxum.medicine.entity.util;

public class SeacherNew {
private Integer  page;
private Integer  rows;
private String  title;
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
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
@Override
public String toString() {
	return "SeacherNew [page=" + page + ", rows=" + rows + ", title=" + title
			+ "]";
}

}
