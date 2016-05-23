package org.nxum.medicine.service;

import java.util.List;

import org.nxum.medicine.view.entity.AdminResultOrder;
import org.nxum.medicine.view.entity.AdminSeacherOrder;
import org.nxum.medicine.view.entity.UpdateOrderEntity;

public interface AdminOrderService {
	public List<AdminResultOrder> adminFindOrder(Integer page, Integer rows);

	// 进行orderCount的计算
	public Integer adminGetRowCount();

	// 进行用户查询到的order
	public List<AdminResultOrder> adminSeacherOrderList(
			AdminSeacherOrder adminSeacherOrder);

	// 进行用户查询到的order的数据计算
	public Integer adminGetSeacherOrderListCount(
			AdminSeacherOrder adminSeacherOrder);

	// 进行userOrderDetail的填写
	public List<UpdateOrderEntity> orderDetaildiaLog(String orderno);

	// 进行订单状态的改变
	public boolean adminChangStatus(String statusNo, Integer status);
}
