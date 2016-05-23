package org.nxum.medicine.dao;
import java.util.List;

import org.nxum.medicine.entity.Order;
import org.nxum.medicine.entity.OrderProduct;
import org.nxum.medicine.util.MybatisDao;
import org.nxum.medicine.view.entity.OrderParameterUserIdOrOrderNo;
import org.nxum.medicine.view.entity.UpdateOrderEntity;
@MybatisDao
public interface OrderDao {
	//保存order_product
	public  void  saveOrderProduct(OrderProduct orderProduct);
    //保存订单order
	public  void saveOrder(Order order);
	//进行订单的查询
	public  List<UpdateOrderEntity>  findcurrentUserOrder(OrderParameterUserIdOrOrderNo parameterOrder);
	//修改用户的信息订单中的状态
	public  void  updateStatus(String orderNo);
}
