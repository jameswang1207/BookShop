package org.nxum.medicine.admin.controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.entity.util.SearchUserName;
import org.nxum.medicine.service.AdminManagerUserService;
import org.nxum.medicine.util.JsonResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("/Admin")
public class AdminUserController {
	   @Autowired
	   private  AdminManagerUserService   service;
	   public void setService(AdminManagerUserService service) {
		this.service = service;
	   }	  
	  @RequestMapping(value="/AdminManagerUser",method=RequestMethod.POST)
	  @ResponseBody
	  public Map<String,Object>  requestUserJson(@RequestParam Integer page,//当前页
			                                     @RequestParam Integer rows,//每页的条数
			                                     SearchUserName  searchUserName
			                     ){
		     if(searchUserName.getUserName()==null||searchUserName.getUserName()==""){
//数据库中的数据的总记录数 	 
		     Integer  userCount  =  service.getAdminUserCountService();
	         List<User>  users =  service.adminManagerUserService(page,rows);
//构造返回页面的数据类型
	         Map<String,Object>  jsonMap =  JsonResponseData.JsonMapResponse(users,userCount);
	          if(users!=null){
	        	     return jsonMap;
	          }else{
	        	     return null;
	          }
		     }else{
//System.out.println("你好啊easyui");
//System.out.println(searchUserName.getUserName());
		    	         User  adminUser  = service.adminsSearchUser(searchUserName.getUserName());
		    	         List<User> adminUserlist =  new ArrayList<User>();
		    	         adminUserlist.add(adminUser);
		    	 	         Map<String,Object>  jsonMap =  JsonResponseData.JsonMapResponse(adminUserlist,1);
		    	 	          if(adminUser!=null){
		    	 	        	     return jsonMap;
		    	 	          }else{
		    	 	        	     return null;
		    	 	          } 
		     }
	     }
	@RequestMapping(value="/AdminDeleteUser/{idsString}",method=RequestMethod.DELETE)
	@ResponseBody
	public  boolean  adminDeleteUser(@PathVariable("idsString")  String  idsString){
//System.out.println("客户端传来的字符串："+idsString);
		        boolean   isDelete =  service.adminDeleteUser(idsString);
		         if(isDelete){
		        	   return  true;
		         }else{
		        	 return  false;
		         }
	   }
	@RequestMapping(value="/AdminAddUser",method=RequestMethod.POST)
	@ResponseBody
	public  boolean adminAddUser(User user){
		//System.out.println("添加的用户是"+user);
		    boolean  isAdd = service.adminAddUser(user);
		    if(isAdd){
		    	 return  true;
		    }else{
		    	 return false;
		    }
	} 
}
