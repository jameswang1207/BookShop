package org.nxum.medicine.serviceImpl;

import java.util.List;
import org.nxum.medicine.dao.OrderDao;
import org.nxum.medicine.entity.Order;
import org.nxum.medicine.entity.OrderProduct;
import org.nxum.medicine.entity.ShoppingCart;
import org.nxum.medicine.entity.ShoppingCartOfProduct;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.service.OrderService;
import org.nxum.medicine.util.DateUtil;
import org.nxum.medicine.util.RandomData;
import org.nxum.medicine.view.entity.OrderParameterUserIdOrOrderNo;
import org.nxum.medicine.view.entity.UpdateOrderEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("orderService")
public class OrderServiceImpl implements  OrderService {
	@Autowired
	private OrderDao  dao;
	@Override
	 public void saveOrder(User user,List<ShoppingCartOfProduct> scfps,Double cost,ShoppingCart cart){
			Order  order  =  new   Order();
			order.setStatus(1);
			order.setUserId(user.getId());
			order.setOrderNo(DateUtil.getCurrentDateStr()+RandomData.randomData());
			order.setCreateTime(DateUtil.getCurrentDateStrCreate());
			order.setCost(cost);
	    	//保存order
	    	this.dao.saveOrder(order);
		
    	//将购物车中的商品一个一个拿出来进行保存
    	for(ShoppingCartOfProduct scfp:scfps ){
    		OrderProduct  orderProduct=  new OrderProduct();
    		orderProduct.setNum(scfp.getCount());
    		orderProduct.setOrderId(order.getId());
    		orderProduct.setProductId(scfp.getProduct().getId());
    		this.dao.saveOrderProduct(orderProduct);
    	}
	}
	@Override
	public List<UpdateOrderEntity> findcurrentUserOrder(Integer userId,String orderNo) {
		    OrderParameterUserIdOrOrderNo  orderNoOruserId =  new OrderParameterUserIdOrOrderNo();
            orderNoOruserId.setOrderNo(orderNo);
            orderNoOruserId.setUserId(userId);
            List<UpdateOrderEntity> orders= this.dao.findcurrentUserOrder(orderNoOruserId);
		    return orders;
	}
	@Override
	public boolean updateStatus(String orderNo) {
		   this.dao.updateStatus(orderNo);
		   return true;
	}
}
