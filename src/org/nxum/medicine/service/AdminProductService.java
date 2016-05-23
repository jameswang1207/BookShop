package org.nxum.medicine.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.entity.Product;
import org.nxum.medicine.view.entity.AdminProductResult;
import org.nxum.medicine.view.entity.AdminSearchProductParamete;
import org.springframework.web.multipart.MultipartFile;

public interface AdminProductService {
  //查询product
   public   List<AdminProductResult>   adminFindProduct(Integer page,Integer rows);
  //pageCount
    public  Integer  adminGetProductCount();
  //查询商品
    public  List<AdminProductResult> adminSearchProduct(AdminSearchProductParamete seacherProduct);
  //查到的商品的件数  
    public  Integer  adminGetSeacherProductCount(AdminSearchProductParamete seacherProduct);
   //查询商品大类信息
    public List<MedicineBigType>  adminFindAllBig();  
   //查询商品小类信息
    public List<MedicineSmalltype> adminFindAllSmall(Integer bigTypeId);
    //ajax检测Product的name是否重复
    public  Product  ajaxCheckProdcutName(String name);
    //adminAddProduct
    public  boolean  adminAddProduct(Product  product,MultipartFile file,HttpServletRequest  request);
    //进行产品的删除
    public boolean  adminDeleteProduct(String  idArraystring);
    //进行产品的修改
    public  boolean adminUpdateProduct(Product product,MultipartFile file, HttpServletRequest  request);
    //进行热卖商品的设置
    public   boolean  adminSetHotProduct(String  idString);
    //进行特价商品的设置
    public   boolean  adminSetSproduct(String idString);
    //进行商品的特价取消
    public boolean  adminCancelSpecialProduct(String idString);
    //进行商品的热卖取消
    public boolean  adminCancelHotProduct(String  idString);
}
