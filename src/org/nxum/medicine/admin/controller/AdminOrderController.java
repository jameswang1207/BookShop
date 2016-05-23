package org.nxum.medicine.admin.controller;
import java.util.List;
import java.util.Map;
import org.nxum.medicine.entity.util.SeacherOrder;
import org.nxum.medicine.service.AdminOrderService;
import org.nxum.medicine.util.JsonResponseData;
import org.nxum.medicine.view.entity.AdminResultOrder;
import org.nxum.medicine.view.entity.AdminSeacherOrder;
import org.nxum.medicine.view.entity.UpdateCartOfProduct;
import org.nxum.medicine.view.entity.UpdateOrderEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("/Admin")
public class AdminOrderController {
	@Autowired
    private AdminOrderService  service;

	public AdminOrderService getService() {
		return service;
	}
	public void setService(AdminOrderService service) {
		this.service = service;
	}
	@RequestMapping(value="/adminFindOrder",method=RequestMethod.POST)
	@ResponseBody
	public   Map<String,Object>  adminFindOrder(SeacherOrder seacherOrder){
//System.out.println("传来的order的数据"+seacherOrder);
if((seacherOrder.getOrderno()==null||seacherOrder.getOrderno()=="")&&(seacherOrder.getTruename()==null||seacherOrder.getTruename()=="")){
		   List<AdminResultOrder> orders =
				   this.service.adminFindOrder(seacherOrder.getPage(),seacherOrder.getRows());
		   Integer  rowCount  =  this.service.adminGetRowCount();
		   Map<String,Object>  jsonMap=
				            JsonResponseData.JsonMapResponse(orders, rowCount);
		      if(orders!=null){
		    	    return jsonMap;
		      }else{
		    	    return null;
		      }
		  }else{
			   AdminSeacherOrder  adminSeacherOrder  =  new AdminSeacherOrder();
			   //进行orderno的判断
			  if(seacherOrder.getOrderno()==null||seacherOrder.getOrderno()==""){
				       adminSeacherOrder.setOrderno("*");
			  }else{
				      adminSeacherOrder.setOrderno("%"+seacherOrder.getOrderno()+"%");
			  }
			  //进行truename的判断
			  if(seacherOrder.getTruename()==null||seacherOrder.getTruename()==""){
				        adminSeacherOrder.setTruename("*");
			  }else{
				        adminSeacherOrder.setTruename(seacherOrder.getTruename());
			  }
			  //进行用户的分页的设置   
			      adminSeacherOrder.setPage(seacherOrder.getPage());
			      adminSeacherOrder.setRows(seacherOrder.getRows());
			       List<AdminResultOrder>  orderLists = 
			    		   this.service.adminSeacherOrderList(adminSeacherOrder);
			       Integer  rowCount  = 
			    		   this.service.adminGetSeacherOrderListCount(adminSeacherOrder);
			     Map<String,Object> jsonMap= JsonResponseData.JsonMapResponse(orderLists, rowCount);
			      if(orderLists!=null){
			    	    return  jsonMap;
			      }else{
			    	    return null;
			      }
		  }
	}
	
	@RequestMapping(value="/orderDetailData",method=RequestMethod.POST)
	@ResponseBody
	public  Map<String,Object> orderDetailData(@RequestParam("orderno") String orderno){
		   List<UpdateOrderEntity> orders =  this.service.orderDetaildiaLog(orderno);
		   // 进行order中商品的数量进行计算
		   List<UpdateCartOfProduct>  products =  null;
		   for(UpdateOrderEntity adminUpdateOrder:orders){
			       products  =  adminUpdateOrder.getProducts();
			       for(UpdateCartOfProduct  product:products){
			    	     product.setProductSubtotal(product.getProductCount()*product.getPrice());
 // System.out.println(product.getProductSubtotal());
			       }
		   }
		   Map<String,Object>  jsonMap =  JsonResponseData.JsonMapResponse(products,products.size());
		        if(orders.size()!=0){
		        	   return  jsonMap;
		        }else{
		        	  return  null;
		        }
	}
	@RequestMapping(value="/adminChangeStatus/{adminStatusOrderNoString}/{value}",method=RequestMethod.PUT)
	@ResponseBody
	public  boolean  adminChangeStatus(@PathVariable("adminStatusOrderNoString") String statusOrderno,
			                           @PathVariable("value") Integer  status
			                             ){
 		 boolean  isChangeStatus=  this.service.adminChangStatus(statusOrderno, status);
 		     if(isChangeStatus){
 		    	   return  true;
 		     }else{
 		    	   return  false;
 		     }
	}
	
}
