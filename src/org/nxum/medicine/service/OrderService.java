package org.nxum.medicine.service;

import java.util.List;

import org.nxum.medicine.entity.ShoppingCart;
import org.nxum.medicine.entity.ShoppingCartOfProduct;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.view.entity.UpdateOrderEntity;

public interface OrderService {
	// 进行订单的保存
	public void saveOrder(User user, List<ShoppingCartOfProduct> scfps,
			Double cost, ShoppingCart cart);

	// 进行订单的查询：用户名查询or订单号查询
	public List<UpdateOrderEntity> findcurrentUserOrder(Integer userId,
			String order);

	// 修改订单中的status
	public boolean updateStatus(String orderNo);
}
