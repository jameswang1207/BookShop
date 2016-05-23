package org.nxum.medicine.entity;

public class ShoppingCartOfProduct {
	private Integer id;// 当前的购物车中的product的编号
	private Product product;
	private Integer count;// 用来记录产品的数量

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ShoppingCartOfProduct [id=" + id + ", product=" + product
				+ ", count=" + count + "]";
	}
}
