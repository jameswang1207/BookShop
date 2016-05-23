package org.nxum.medicine.entity;

public class OrderProduct {
	private Integer id;
	private Integer num;// 每件产品的数量
	private Integer orderId;// 订单id
	private Integer productId;// 产品id

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	@Override
	public String toString() {
		return "OrderProduct [id=" + id + ", num=" + num + ", orderId="
				+ orderId + ", productId=" + productId + "]";
	}

}
