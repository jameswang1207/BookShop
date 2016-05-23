package org.nxum.medicine.admin.controller;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.entity.Product;
import org.nxum.medicine.entity.util.SearchProductName;
import org.nxum.medicine.service.AdminProductService;
import org.nxum.medicine.util.JsonResponseData;
import org.nxum.medicine.view.entity.AdminProductResult;
import org.nxum.medicine.view.entity.AdminSearchProductParamete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
@Controller
@RequestMapping("/Admin")
public class AdminProductController {
	@Autowired
	private  AdminProductService   service;
	public AdminProductService getService() {
		return service;
	}
	public void setService(AdminProductService service) {
		this.service = service;
	}
	@RequestMapping(value="/AdminManagerProcut",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object>  requestProductJson(SearchProductName productUtil)
	{
		    if(productUtil.getProductName()==null||productUtil.getProductName()==""){
//System.out.println("用户的发送的当前页码数："+productUtil.getPage()+"每页显示的条数："+productUtil.getRows());
List<AdminProductResult>  products =
		    		service.adminFindProduct(productUtil.getPage(),productUtil.getRows());
//计算数据库中的数据的总记录数
		    Integer  productCount  =  service.adminGetProductCount();
	         Map<String,Object>  jsonMap =  JsonResponseData.JsonMapResponse(products, productCount);
			       if(products!=null){
			    	       return   jsonMap;
			       }else{
			    	         return  null;
			       }
		    }else{
		    	AdminSearchProductParamete  adminParameter  =  new AdminSearchProductParamete();
		    	adminParameter.setProductName("%"+productUtil.getProductName()+"%");
		    	adminParameter.setPage(productUtil.getPage());
		    	adminParameter.setRows(productUtil.getRows());
		   List<AdminProductResult>  searchs =  service.adminSearchProduct(adminParameter);
		   //从中得到从数据库中的数据的相匹配的想的个数
		   Integer  searchCount  =  service.adminGetSeacherProductCount(adminParameter);
		   Map<String,Object>  jsonMap =  JsonResponseData.JsonMapResponse(searchs,searchCount);
					   if(searchs!=null){
						     return   jsonMap; 
					   }else{
						   return  null;
					   }
		      }
	     }
	
	@RequestMapping(value="/SelectBigType",method=RequestMethod.POST)
	@ResponseBody
	public  List<MedicineBigType> adminFindSelectBig(){
		     List<MedicineBigType>   bigTypes = this.service.adminFindAllBig();
		      return   bigTypes;
	} 
	
	@RequestMapping(value="/SelectSmallType/{bigTypeId}",method=RequestMethod.POST)
	@ResponseBody
	public  List<MedicineSmalltype> adminFindSelectSmall(@PathVariable("bigTypeId") Integer bigTypeId){
		      if(bigTypeId==0){
		    	   return  null;
		      }else{
		     List<MedicineSmalltype>   smallTypes = this.service.adminFindAllSmall(bigTypeId);
		      return   smallTypes;
		      }
	   } 
    @RequestMapping(value="/ajaxCheckProductName/{productName}",method=RequestMethod.GET )
    @ResponseBody
	 public   boolean   ajaxCheckProductName(@PathVariable("productName") String   productName){
		      Product  product =    this.service.ajaxCheckProdcutName(productName);
		          if(product!=null){
		        	    return  true;
		           }else{
		        	   return  false; 
		           }
		        
	   }
    
    @RequestMapping(value="/adminAddProduct",method=RequestMethod.POST)
    @ResponseBody
    public    boolean    adminAddProduct(Product  product,
    		                             @RequestParam("file") MultipartFile file,
    		                             HttpServletRequest  request){
    	 boolean  flag =  this.service.adminAddProduct(product,file,request);
    	    if(flag){
    	    	 return  true;
    	    }else{   
    	         return false;
    	    }
       }
    //进行选中的商品的删除
    @RequestMapping(value="/adminDeleteProduct/{adminDeleteIdString}",method=RequestMethod.DELETE)
    @ResponseBody
    public  boolean  adminDeleteProducts(@PathVariable("adminDeleteIdString")  String idArrayString){
    	//System.out.println(idArrayString);
    	    boolean   isDelete=     this.service.adminDeleteProduct(idArrayString);
    	         if(isDelete){
    	        	   return true;
    	         }else{
                       return  false;    	        	 
    	         }
    }
    
    @RequestMapping(value="/adminUpdateProduct",method=RequestMethod.POST)
    @ResponseBody
    public  boolean adminUpdateProductInformation(Product  product,
                                              @RequestParam("file") MultipartFile file,
                                              HttpServletRequest  request){
//System.out.println("传来的文件的大小"+file.getSize());
    	    boolean  isUpdate =  this.service.adminUpdateProduct(product, file, request);
    	  if(isUpdate){
    		   return  true;
    	  }else{
              return  false;    		  
    	  }
    }
    
    //进行商品的热卖设置
    @RequestMapping(value="/adminSetHotProduct/{adminSethotIdString}",method=RequestMethod.PUT)
    @ResponseBody
    public  boolean  adminSetHotProduct(@PathVariable("adminSethotIdString") String adminSethotIdString){
    	        boolean  idUpdateHot  =  this.service.adminSetHotProduct(adminSethotIdString);
    	        if(idUpdateHot){
    	        	  return  true;
    	        }else{
    	        	   return  false;
    	        }
    }
    
    //进行特价商品的设置
    @RequestMapping(value="/adminSetSProduct/{adminSetSIdString}",method=RequestMethod.PUT)
    @ResponseBody
    public  boolean  adminSetSProduct(@PathVariable("adminSetSIdString") String adminSetSIdString){
    	       boolean   idUpdateSpecial   =  this.service.adminSetSproduct(adminSetSIdString);
    	        if(idUpdateSpecial){
    	        	  return  true;
    	        }else{
    	        	  return  false;
    	        }
    }
    //取消商品热卖
    @RequestMapping(value="/adminCancelHotProduct/{adminCancelhotIdString}",method=RequestMethod.PUT)
    @ResponseBody
    public   boolean adminCancelHotProduct(@PathVariable("adminCancelhotIdString") String adminCancelhotIdString){
    	       boolean  isCannelHot =  this.service.adminCancelHotProduct(adminCancelhotIdString);
    	       if(isCannelHot){     
    	           return  true;
    	       }else{
    	    	   return  false;
    	       }
    }
    //取消商品的特价
    @RequestMapping(value="/adminCancelSpecialProduct/{adminCancelIdString}",method=RequestMethod.PUT)
    @ResponseBody
    public  boolean  adminCancelSpecialProduct(@PathVariable("adminCancelIdString") String adminCancelIdString){
    	     boolean  isCannelSpecial =  this.service.adminCancelSpecialProduct(adminCancelIdString);
    	      if(isCannelSpecial){
    	    	    return  true;
    	      }else{
    	    	    return false;
    	      }
    }
}
