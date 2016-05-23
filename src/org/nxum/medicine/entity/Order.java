package org.nxum.medicine.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Order {
	private Integer id;
	private Double cost;// 总价格是多少钱
	private Date createTime;// 订单的创建时间
	private String orderNo;// 订单号
	private Integer status;// 四种状态
	private Integer userId;// 用户
	// 将orderProduct中的产品的件数加到里面，以免返回(每个产品的件数)
	private Integer productCount;

	public Integer getProductCount() {
		return productCount;
	}

	public void setProductCount(Integer productCount) {
		this.productCount = productCount;
	}

	private List<Product> products = new ArrayList<Product>();

	// 一个订单中有多个商品信息
	public Integer getUserId() {
		return userId;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

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

	@Override
	public String toString() {
		return "Order [id=" + id + ", cost=" + cost + ", createTime="
				+ createTime + ", orderNo=" + orderNo + ", status=" + status
				+ ", userId=" + userId + ", productCount=" + productCount
				+ ", products=" + products + "]";
	}
}
