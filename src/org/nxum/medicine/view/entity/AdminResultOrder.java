package org.nxum.medicine.view.entity;
import java.sql.*;
public class AdminResultOrder {
	private Integer orderId;
    private  Double cost;
    private Date  createtime;
    private  String  orderno;
    private  Integer  orderStatus;
    private Integer   userId;
    private String  address;
    private Date  birthday;
    private String  idcard;
    private String email;
    private String mobile;
    private String  password;
    private String  gender;
    private Integer userStatus;
    private String  truename;
    private String  username;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Integer getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "AdminResultOrder [orderId=" + orderId + ", cost=" + cost
				+ ", createtime=" + createtime + ", orderno=" + orderno
				+ ", orderStatus=" + orderStatus + ", userId=" + userId
				+ ", address=" + address + ", birthday=" + birthday
				+ ", idcard=" + idcard + ", email=" + email + ", mobile="
				+ mobile + ", password=" + password + ", gender=" + gender
				+ ", userStatus=" + userStatus + ", truename=" + truename
				+ ", username=" + username + "]";
	}
	
    
}
