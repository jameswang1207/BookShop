package org.nxum.medicine.dao;
import java.util.List;

import org.nxum.medicine.util.MybatisDao;
import  org.nxum.medicine.entity.*;
@MybatisDao
public interface ProductDao {
  //进行热卖商品的查询
   public  List<Product>  findHotAll();
  //进行特价商品的查询
   public  List<Product>  findSpricalAll();
  //根据商品的大类信息进行商品的查询
   public  List<Product>  findProductTigTypeList(Product product);
  //根据根据商品的大类信息进行商品的查询一共有多少条数据
   public  Integer  getRowCount(Integer bigTypeId);
  //用来发现小商品的查询
   public List<Product>  findMedicineSmallTypeList(Product product);
   //用来得到小商品的条数
   public  Integer  getSmallTypeRowCount(Integer bigTypeId);
   //按商品的id返回一条数据
   public  Product  findMedicineById(Integer  medicineId);
}
