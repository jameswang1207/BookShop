package org.nxum.medicine.view.entity;
public class OrderParameterUserIdOrOrderNo {
 private Integer  userId;
 private String   orderNo;
public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}
public String getOrderNo() {
	return orderNo;
}
public void setOrderNo(String orderNo) {
	this.orderNo = orderNo;
}
@Override
public String toString() {
	return "OrderParameterUserIdOrOrderNo [userId=" + userId + ", orderNo="
			+ orderNo + "]";
}
}
