package org.nxum.medicine.service;
import java.util.List;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.view.entity.AdminSeacherSmallProduct;
import org.nxum.medicine.view.entity.AdminSmallProductResult;
public interface AdminSmallProductService {
	//查询的全部的商品
public  List<AdminSmallProductResult>  adminFindAllSmallProduct(AdminPageBean pageBean);
    //查询商品的数量
public  Integer  adminGetSmallProductCount();
// adminSeacherProdct
public  List<AdminSmallProductResult> adminSeacherSmallProduct(AdminSeacherSmallProduct  smallProduct);
//进行所搜的Count
public  Integer   adminGetSeacherSmallProductCount(AdminSeacherSmallProduct  smallProduct);
//进行商品的name的repeat
public  boolean     adminCheckSmallNameRepeat(String  name);
//进行商品小类的添加
public  boolean  adminAddSmallProduct(MedicineSmalltype  smallProduct);
//进行商品小类的修改
public   boolean  adminUpdateSmallProduct(MedicineSmalltype  smallProduct);
//进行商品的删除
public   Integer adminDeleteSmallProduct(String   StringId);
}
