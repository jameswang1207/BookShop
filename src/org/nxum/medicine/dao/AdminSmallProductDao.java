package org.nxum.medicine.dao;
import java.util.List;

import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.entity.Product;
import org.nxum.medicine.util.MybatisDao;
import org.nxum.medicine.view.entity.AdminSeacherSmallProduct;
import org.nxum.medicine.view.entity.AdminSmallProductResult;
@MybatisDao
public interface AdminSmallProductDao {
	//获得全部的商品小类
     public  List<AdminSmallProductResult> adminFindAllSmallProduct(AdminPageBean  pageBean); 
    //获得商品的count值
     public  Integer  adminGetSmallProductCount();
    //进行商品小类的搜索
     public  List<AdminSmallProductResult> adminSeacherSmallProduct(AdminSeacherSmallProduct smallProduct);
    //进行商品的
    public  Integer adminSeacherSmallProductCount(AdminSeacherSmallProduct smallProduct);
    //进行商品的小类名的repeat检验
    public    MedicineSmalltype adminSmallProductRepeat(String name);
    //进行商品小类的添加
    public  void   adminAddSmallProduct(MedicineSmalltype  smallProduct);
    //进行商品小类的修改
    public  void  adminUpdateSmallProduct(MedicineSmalltype  smallProduct);
    //进行商品的删除
    public  void  adminDeleteSmallProduct(Integer idString);
    //检测有无商品进行关联
    public List<Product> adminCheckRelatedProduct(Integer  bigProduct);
}
