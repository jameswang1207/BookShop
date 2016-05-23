package org.nxum.medicine.controller;
import java.util.List;

import org.nxum.medicine.dao.ProductDao;
import org.nxum.medicine.entity.Product;
import org.nxum.medicine.util.NavigationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class MedinineTypeList {
	//确定页面显示药品的条数
	private static  final  Integer pageSize=8;
	@Autowired
	private  ProductDao  dao ;
	@RequestMapping(value="/toMedicineList/{bigTypeId}/{pageNow}",method=RequestMethod.GET)
	public String toMedicineList(@PathVariable("bigTypeId") Integer bigTypeId,
			                     @PathVariable("pageNow") Integer pageNow,  
			                     ModelMap map){
		     //查询一共有多少行
		      Integer  rowCount  =   this.dao.getRowCount(bigTypeId);
		      Product  product  =  new Product();
		      product.setPageSize(pageSize);
		      product.setPageNow(pageNow);
		      //进行pageCount的计算
		      Integer  pageCount  = 
       rowCount%product.getPageSize()==0?rowCount/product.getPageSize():rowCount/product.getPageSize()+1 ;
			  product.setBigtypeId(bigTypeId);
			  product.setPageCount(pageCount);
		 List<Product>  medicineByBigTypeId  =  this.dao.findProductTigTypeList(product);
		 String navUtil = NavigationUtil.genNavCode("书籍列表");
		  map.addAttribute("medicineByBigTypeId", medicineByBigTypeId);
		  map.addAttribute("product",product);
		  map.addAttribute("medicineBigTypeId",bigTypeId);
		  map.addAttribute("navUtil",navUtil);
		   //返回一个要包含的页面信息
		  map.addAttribute("pageView","../product/medicineList.jsp");
		  //判断是大类还是小类商品1表示大类商品，0表示小类商品
		  map.addAttribute("type",1);
		return "medicineMain";
	} 
}
