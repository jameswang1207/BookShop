package org.nxum.medicine.view.entity;

public class AdminChangStatus {
private  Integer  status;
private   String   orderno;


public Integer getStatus() {
	return status;
}
public void setStatus(Integer status) {
	this.status = status;
}
public String getOrderno() {
	return orderno;
}
public void setOrderno(String orderno) {
	this.orderno = orderno;
}
@Override
public String toString() {
	return "AdminChangStatus [status=" + status + ", orderno=" + orderno + "]";
}
}
