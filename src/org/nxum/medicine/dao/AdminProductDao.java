package org.nxum.medicine.dao;
import java.util.List;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.entity.Product;
import org.nxum.medicine.util.MybatisDao;
import org.nxum.medicine.view.entity.AdminProductResult;
import org.nxum.medicine.view.entity.AdminSearchProductParamete;
@MybatisDao
public interface AdminProductDao {
  //admin进行商品的显示查看
  public  List<AdminProductResult>  adminFindAllProduct(AdminPageBean  page); 
  //查询商品的数量
  public   Integer   getAdminProductCount();
  //用户查询商品通过名字进行查询
  public  List<AdminProductResult>  adminSerachAllProduct(AdminSearchProductParamete productParameter);
  //查询到的product的商品的数量
  public  Integer  getAdminSearchCount(AdminSearchProductParamete productParameter);
  //查询商品的大类信息
  public  List<MedicineBigType>  adminFindAllProductBig();
  //查询所有的商品小类信息
  public  List<MedicineSmalltype> adminFindAllProductSmall(Integer bigTypeId);
  //检测产品名是否重复
  public   Product  ajaxCheckProductName(String  name);
  //admin添加产品
  public  void  adminAddProduct(Product product);
  //进行商品的删除
  public  void  adminDeleteProduct(Integer  productId);
  //进行有产品图片信息的修改
  public    void adminUpdateProduct(Product  product);
  //进行没有图片的修改
  public     void  adminNotUpdateProduct(Product  product);
  //设置热卖商品
  public  void  adminSethotProduct(Product hotProduct);
  //设置特价商品
  public  void  adminSetSProduct(Product specialPriceProduct);
  
}
