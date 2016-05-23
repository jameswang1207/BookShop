package org.nxum.medicine.view.entity;

import org.nxum.medicine.entity.AdminPageBean;

public class AdminSeacherOrder  extends  AdminPageBean{
private String  orderno;
private String  truename;
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
	return "AdminSeacherOrder [orderno=" + orderno + ", truename=" + truename
			+ "]";
}
}
