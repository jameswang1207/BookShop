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
public class MedicineSmallTypeList {
	   //确定页面显示药品的条数
		private static  final  Integer pageSize=8;
		@Autowired
		private  ProductDao  dao ;
 @RequestMapping(value="/toMedicineSmallList/{smallTypeId}/{pageNow}",method=RequestMethod.GET)
  public  String   toMedicineSmallList(@PathVariable("smallTypeId") Integer smallTypeId,
                                       @PathVariable("pageNow") Integer pageNow,  
                                       ModelMap map){
				//查询一共有多少行
				Integer  rowCount  =this.dao.getSmallTypeRowCount(smallTypeId);
				Product  product  =  new Product();
				product.setPageSize(pageSize);
				product.setPageNow(pageNow);
				//进行pageCount的计算
				Integer  pageCount  = 
				rowCount%product.getPageSize()==0?rowCount/product.getPageSize():rowCount/product.getPageSize()+1 ;
				product.setSmallTypeId(smallTypeId);
				product.setPageCount(pageCount);
				List<Product>  medicineSmallType  =  this.dao.findMedicineSmallTypeList(product);
				String navUtil = NavigationUtil.genNavCode("药品列表");
				map.addAttribute("medicineByBigTypeId", medicineSmallType);
				map.addAttribute("product",product);
				map.addAttribute("medicineBigTypeId",smallTypeId);
				map.addAttribute("navUtil",navUtil);
			    //返回一个要包含的页面信息
				map.addAttribute("pageView","../product/medicineList.jsp");
				  //判断是大类还是小类商品
			    map.addAttribute("type",0);
				return "medicineMain";
  }
}
