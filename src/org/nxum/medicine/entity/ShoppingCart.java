package org.nxum.medicine.entity;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
	// 当前在使用该购物车的user的id
	private Integer userId;
	// 记录shoppingcart中商品的种类
	private Integer cartSize = 0;
	// 购物车中的产品列表
	private List<ShoppingCartOfProduct> shoppingCartOfProducts = new ArrayList<ShoppingCartOfProduct>();

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCartSize() {
		return cartSize;
	}

	public void setCartSize(Integer cartSize) {
		this.cartSize = cartSize;
	}

	public List<ShoppingCartOfProduct> getShoppingCartOfProducts() {
		return shoppingCartOfProducts;
	}

	public void setShoppingCartOfProducts(
			List<ShoppingCartOfProduct> shoppingCartOfProducts) {
		this.shoppingCartOfProducts = shoppingCartOfProducts;
	}

	// 重写toString方法
	@Override
	public String toString() {
		return "ShoppingCart [userId=" + userId + ", shoppingCartOfProducts="
				+ shoppingCartOfProducts + "]";
	}
}
