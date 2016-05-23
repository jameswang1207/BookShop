package org.nxum.medicine.view.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class UpdateOrderEntity {
	private Integer  id;
	private Double  cost;//总价格是多少钱
	private Date  createTime;//订单的创建时间
	private String orderNo;//订单号
	private Integer status;//四种状态
	private Integer  userId;//用户
	private  List<UpdateCartOfProduct>  products = new  ArrayList<UpdateCartOfProduct>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public List<UpdateCartOfProduct> getProducts() {
		return products;
	}
	public void setProducts(List<UpdateCartOfProduct> products) {
		this.products = products;
	}
	@Override
	public String toString() {
		return "UpdateOrderEntity [id=" + id + ", cost=" + cost
				+ ", createTime=" + createTime + ", orderNo=" + orderNo
				+ ", status=" + status + ", userId=" + userId + ", products="
				+ products + "]";
	}
	
}
