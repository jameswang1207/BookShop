package org.nxum.medicine.admin.controller;

import java.util.List;
import java.util.Map;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.entity.util.SeacherSmallProductName;
import org.nxum.medicine.service.AdminSmallProductService;
import org.nxum.medicine.util.JsonResponseData;
import org.nxum.medicine.view.entity.AdminSmallProductResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.nxum.medicine.view.entity.AdminSeacherSmallProduct;
@RequestMapping("/Admin")
@Controller
public class AdminSmallProductController {
	  @Autowired
	  private AdminSmallProductService  service;
			 public AdminSmallProductService getService() {
				return service;
			}
			public void setService(AdminSmallProductService service) {
				this.service = service;
			}

	@RequestMapping(value="/adminFindAllSmallProduct",method=RequestMethod.POST)
	 @ResponseBody
     public  Map<String,Object> smallProducts(SeacherSmallProductName smallProduct){
		
		    if(smallProduct.getSmallProductName()==""||smallProduct.getSmallProductName()==null){
		AdminPageBean  pageBean  =  new AdminPageBean();
		 pageBean.setPage(smallProduct.getPage());
		 pageBean.setRows(smallProduct.getRows());
		 
       List<AdminSmallProductResult>   smallProducts = 
    		                     this.service.adminFindAllSmallProduct(pageBean);
       Integer   total =  this.service.adminGetSmallProductCount();
        Map<String,Object>  jsonMap = JsonResponseData.JsonMapResponse(smallProducts, total);
		        if(smallProducts.size()!=0){
		        	  return  jsonMap;
		        } else{
		        	   return  null;
		        }
		         }else{
		  //System.out.println("+++++:"+smallProduct);	
		 AdminSeacherSmallProduct   seacherSmallProduct  =  new   AdminSeacherSmallProduct();
		 seacherSmallProduct.setSmallProductName("%"+smallProduct.getSmallProductName()+"%");
		 seacherSmallProduct.setPage(smallProduct.getPage());
		 seacherSmallProduct.setRows(smallProduct.getRows());
		 //System.out.println("page:"+smallProduct.getPage());
		 //System.out.println("row:"+smallProduct.getRows());
		 List<AdminSmallProductResult>  smallProducts = 
				                       this.service.adminSeacherSmallProduct(seacherSmallProduct);
		 Integer  total  = 
				       this.service.adminGetSeacherSmallProductCount(seacherSmallProduct);
		 Map<String,Object>  jsonMap =  JsonResponseData.JsonMapResponse(smallProducts,total);
		 
 		    	    if(smallProducts.size()!=0){
 		    	    	 return  jsonMap;
 		    	    }else{
 		    	    	 return  null;
 		    	    }
		    }
   }  
	
	@RequestMapping(value="/adminCheckSmallProductRepeat/{name}",method=RequestMethod.GET)
	@ResponseBody
	//进行商品小类的检测
	public   boolean     checkSmallProductNameRepeat(@PathVariable("name")  String  name){
		        boolean  isSmallProductRepeat =   
		        		   this.service.adminCheckSmallNameRepeat(name);
		          if(isSmallProductRepeat){
		        	    return  true;
		        	  
		          }else{
                        return  false;  		        	  
		          }
	}
	
	//进行商品小类的添加
	@RequestMapping(value="/adminAddSmallProduct",method=RequestMethod.POST)
	@ResponseBody
	public   boolean  adminAddSmallProduct(MedicineSmalltype   smallProduct){
		   boolean  isAddSmallProduct =  
				        this.service.adminAddSmallProduct(smallProduct);
		       if(isAddSmallProduct){
		    	      return  true;
		       }else{
		    	     return  false;
		       }
	}
	
	//进行商品的修改
	@RequestMapping(value="/adminUpdateSmallProduct",method=RequestMethod.POST)
	@ResponseBody
	public   boolean  adminUpdateSmallProduct(MedicineSmalltype smallProduct){
		    boolean  isUpdateSmallProduct =
		    		 this.service.adminUpdateSmallProduct(smallProduct);
		     if(isUpdateSmallProduct){
		    	   return true;
		     }else{
		    	  return false;
		     }
	}
	
	//进行商品的删除
	@RequestMapping(value="/adminDeleteSmallProduct/{idString}",method=RequestMethod.DELETE)
	@ResponseBody
	public   boolean   adminDeleteSmallProduct(@PathVariable("idString") String   idString){
		      Integer  idDelete = 
		    		   this.service.adminDeleteSmallProduct(idString);
		        if(idDelete==2){
		        	    return  true;
		        }else{
		        	   return  false;
		          }	
		        }
}
