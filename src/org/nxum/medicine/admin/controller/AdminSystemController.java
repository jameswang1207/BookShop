package org.nxum.medicine.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.nxum.medicine.service.AdminSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
@RequestMapping("/Admin")
@Controller
public class AdminSystemController{
	@Autowired
	private AdminSystemService  service;
	
   public AdminSystemService getService() {
		return service;
	}

	public void setService(AdminSystemService service) {
		this.service = service;
	}
  @RequestMapping(value="/confirmOldPassword/{oldPassword}",method=RequestMethod.GET)
  @ResponseBody
  public  boolean  adminUpdatePassword(@PathVariable("oldPassword") String oldPassword){
	       boolean isConfirm =  this.service.adminUpdatePassword(oldPassword);
	       if(isConfirm){
	    	      return  true;
	       }else{
	    	     return  false;
	       }
   }
  //进行password的修改
  @RequestMapping(value="/adminModifyPassword",method=RequestMethod.POST)
  @ResponseBody
  public   boolean  adminModify(@RequestParam("password") String  password){
	    boolean  isUpdate  =   this.service.adminModifyPassword(password);
	     if(isUpdate){
	    	   return true;
	     }else{
	    	   return  false;
	     }
  }
  //管理员的登出操作
  @RequestMapping(value="/adminLoginOut",method=RequestMethod.GET)
  public  String   adminLoginOut(HttpServletRequest request){
	        request.getSession().invalidate();
	        return "redirect:/Admin/toLogin";
  }
}
