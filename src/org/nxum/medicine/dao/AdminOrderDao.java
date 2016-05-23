package org.nxum.medicine.dao;
import java.util.List;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.util.MybatisDao;
import org.nxum.medicine.view.entity.AdminChangStatus;
import org.nxum.medicine.view.entity.AdminResultOrder;
import org.nxum.medicine.view.entity.AdminSeacherOrder;
import org.nxum.medicine.view.entity.UpdateOrderEntity;
@MybatisDao
public interface AdminOrderDao {
	   public  List<AdminResultOrder> adminFindOrder(AdminPageBean pageBean);
	   //进行order的rowcout的计算
	   public  Integer  adminOrderCount();
	   //进行order的查询
	   public  List<AdminResultOrder> adminSeacherOrder(AdminSeacherOrder adminSeacherOrder);
	   //进行查询到的数据的计数
	   public  Integer adminSeacherOrderCount(AdminSeacherOrder adminSeacherOrder);
	   //根据订单号填写用户orderDetail对话框
	   public  List<UpdateOrderEntity> AdminSeacherOrderByOrderno(String  orderno);
	   //进行订单的状态的改变
	   public   void  adminUpdateStatus(AdminChangStatus status);
}
