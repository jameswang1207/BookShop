package org.nxum.medicine.dao;

import java.util.List;
import org.nxum.medicine.util.MybatisDao;
import org.nxum.medicine.view.entity.ResultSmallProduct;
import  org.nxum.medicine.entity.*;
@MybatisDao
public interface MedicineSmallTypeDao {
   public List<MedicineSmalltype> findAll();
  //按商品的名字进行查询
  public List<ResultSmallProduct> finMedicineSmallNameList(ResultSmallProduct resultSmall);
  //查询小商品的id
  public Integer   getSmallTypeId(String smallName);
 
}
