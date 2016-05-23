package org.nxum.medicine.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
public class MedicineDetailController {
@Autowired	
private ProductDao dao;	
@RequestMapping(value="/toMedicineDetails/{medicineId}",method=RequestMethod.GET)
public  String  toMedicineDetails(HttpServletRequest  request,@PathVariable("medicineId") Integer medicineId,ModelMap map){
	        Product product = this.dao.findMedicineById(medicineId);
	        //从参数中获得session
	        HttpSession  session  = request.getSession();
	        saveMedicineSession(session,product);
	        String  navUtil  = NavigationUtil.genNavCode("书籍详情");
	        map.addAttribute("navUtil",navUtil);
	        map.addAttribute("medicine",product);
	        map.addAttribute("pageView","../product/medicineDetails.jsp");
            return "medicineMain";	
 }
//经商品信息存储到session中，用于显示当前的浏览过的药品
public  void  saveMedicineSession(HttpSession  session,Product product){
	@SuppressWarnings("unchecked")
	List<Product>   medicines = (List<Product>) session.getAttribute("currentMedicine");
    if(medicines==null){
  	  medicines  =  new  ArrayList<Product>(); 
    }
        boolean flag=true;
        for(Product medicine:medicines){
//System.out.println("购物车中的product："+medicine.getId());
        	 if(medicine.getId().equals(product.getId())){
//System.out.println("进入if语句");
        		  flag=false;
        		   break;
        	 }
        }
//System.out.println("刚刚浏览的product中的id："+product.getId()+"flag:"+flag);
        if(flag){
        	medicines.add(0,product);
        }
    //判断集合的大小，只应许放入四个浏览的商品
    if(medicines.size()==4){
  	   medicines.remove(3); 
    }
    //将该集合存入到session中
    session.setAttribute("currentMedicine",medicines);
  }
}
