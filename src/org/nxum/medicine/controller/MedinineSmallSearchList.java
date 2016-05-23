package org.nxum.medicine.controller;
import java.util.List;

import org.nxum.medicine.dao.MedicineSmallTypeDao;
import org.nxum.medicine.dao.ProductDao;
import org.nxum.medicine.util.NavigationUtil;
import org.nxum.medicine.view.entity.ResultSmallProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
@RequestMapping("/medicine")
public class MedinineSmallSearchList{
	   //确定页面显示药品的条数
		private static  final  Integer pageSize=8;
		@Autowired
		private MedicineSmallTypeDao  dao ;
		@Autowired
		private ProductDao  pdao;
 @RequestMapping(value="/toMedicineSmallSeach/{pageNow}",method=RequestMethod.POST)
 public  String   toMedicineSmallList(@RequestParam("smallName") String smallName,
                                      @PathVariable("pageNow") Integer pageNow,  
                                       ModelMap map){
	            Integer   smallTypeId= this.dao.getSmallTypeId(smallName);
//用到的小技巧
	                if(smallTypeId==null){
//防止没有查到的数据，返回错误信息
	                	smallTypeId=1000;
	                }
				//查询一共有多少行
				Integer  rowCount  =this.pdao.getSmallTypeRowCount(smallTypeId);
				ResultSmallProduct  resultSmall  =  new ResultSmallProduct();
				resultSmall.setPageSize(pageSize);
				resultSmall.setPageNow(pageNow);
				//进行pageCount的计算
				Integer  pageCount  = 
				rowCount%resultSmall.getPageSize()==0?rowCount/resultSmall.getPageSize():rowCount/resultSmall.getPageSize()+1 ;
				resultSmall.setSmallName(smallName);
				resultSmall.setPageCount(pageCount);
				
				List<ResultSmallProduct>  medicineSmallType  =  this.dao.finMedicineSmallNameList(resultSmall);
				String navUtil = NavigationUtil.genNavCode("药品列表");
				map.addAttribute("medicineByBigTypeId", medicineSmallType);
				map.addAttribute("product",resultSmall);
				map.addAttribute("medicineBigTypeId",smallTypeId);
				map.addAttribute("navUtil",navUtil);
				//返回一个要包含的页面信息
				map.addAttribute("pageView","../product/medicineList.jsp");
				  //判断是大类还是小类商品
			    map.addAttribute("type",0);
				return "medicineMain";
  }
}

