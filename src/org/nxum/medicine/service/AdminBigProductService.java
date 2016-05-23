package org.nxum.medicine.service;
import java.util.List;
import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.view.entity.AdminSeacherBigProduct;
public interface AdminBigProductService {
	public  List<MedicineBigType>  adminFindBigProduct(Integer page,Integer rows);
	//进行数据的条数
	 public  Integer  adminGetBigProductCount();
	//按商品大类的名字进行查询
	 public  List<MedicineBigType>  adminSeacherProduct(AdminSeacherBigProduct seacherBigProduct);
	 //进行商品的seacherProduct的Count
	 public  Integer getSeacherBigProductCount(String bigProductName);
	 //进行bigProduct名的检测
	 public  boolean  adminCheckBigProductName(String  name);
	 //进行商品大类的添加
	 public  boolean  adminAddBigProduct(MedicineBigType  bigProduct);
	 //进行商品的修改
	 public  boolean  adminUpdateBigProduct(MedicineBigType  bigProduct);
	 //进行商品大类的删除
	 public  boolean  adminDeleteBigProduct(Integer  bigProductId);
}
