package org.nxum.medicine.serviceImpl;

import java.util.List;

import org.nxum.medicine.dao.AdminOrderDao;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.service.AdminOrderService;
import org.nxum.medicine.view.entity.AdminChangStatus;
import org.nxum.medicine.view.entity.AdminResultOrder;
import org.nxum.medicine.view.entity.AdminSeacherOrder;
import org.nxum.medicine.view.entity.UpdateOrderEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {
	@Autowired
	private AdminOrderDao dao;

	public AdminOrderDao getDao() {
		return dao;
	}

	public void setDao(AdminOrderDao dao) {
		this.dao = dao;
	}

	@Override
	public List<AdminResultOrder> adminFindOrder(Integer page, Integer rows) {
		AdminPageBean pageBean = new AdminPageBean();
		pageBean.setPage(page);
		pageBean.setRows(rows);
		List<AdminResultOrder> orders = this.dao.adminFindOrder(pageBean);
		if (orders.size() != 0) {
			return orders;
		} else {
			return null;
		}
	}

	@Override
	public Integer adminGetRowCount() {
		Integer rowCount = this.dao.adminOrderCount();
		return rowCount;
	}

	@Override
	public List<AdminResultOrder> adminSeacherOrderList(
			AdminSeacherOrder adminSeacherOrder) {
		List<AdminResultOrder> orderList = this.dao
				.adminSeacherOrder(adminSeacherOrder);
		if (orderList.size() != 0) {
			return orderList;
		} else {
			return null;
		}
	}

	@Override
	public Integer adminGetSeacherOrderListCount(
			AdminSeacherOrder adminSeacherOrder) {
		Integer rows = this.dao.adminSeacherOrderCount(adminSeacherOrder);
		return rows;
	}

	@Override
	public List<UpdateOrderEntity> orderDetaildiaLog(String orderno) {
		List<UpdateOrderEntity> order = this.dao
				.AdminSeacherOrderByOrderno(orderno);
		if (order != null) {
			return order;
		} else {
			return null;
		}
	}

	@Override
	public boolean adminChangStatus(String statusNo, Integer status) {
		String[] statusN = statusNo.split(",");
		for (String statusn : statusN) {
			AdminChangStatus changeStatus = new AdminChangStatus();
			changeStatus.setOrderno(statusn);
			changeStatus.setStatus(status);
			this.dao.adminUpdateStatus(changeStatus);
		}
		return true;
	}
}
