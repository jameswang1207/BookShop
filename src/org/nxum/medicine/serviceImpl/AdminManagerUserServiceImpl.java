package org.nxum.medicine.serviceImpl;

import java.util.List;
import org.nxum.medicine.dao.AdminLoginDao;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.service.AdminManagerUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("adminManagerUserService")
public  class AdminManagerUserServiceImpl  implements AdminManagerUserService{
	private   AdminLoginDao  dao ;
	@Autowired
	public void setDao(AdminLoginDao dao) {
		this.dao = dao;
	}
    public  List<User>   adminManagerUserService(Integer page,Integer rows){
    	       AdminPageBean adminPage  =  new AdminPageBean();
    	       adminPage.setPage(page);
    	       adminPage.setRows(rows);
               List<User>  users =   this.dao.adminAllUser(adminPage);
                   if(users.size()!=0){
                	   for(User  user:users){
                		    if(user.getGender().equals("M")){
                		    	user.setGender("男");
                		    }else{
                		    	user.setGender("女");
                		    }
                	   }
                	      return  users;
                   }else{
                          return  null;                	   
                   }
     }
	@Override
	public Integer getAdminUserCountService() {
		   Integer  userCount  = dao.getAdminUserCount();
		   return userCount;
	}
	public  User  adminsSearchUser(String  userName) {
		       User  user  =      dao.adminSearchUserName(userName);
		       if(user!=null){
		       if(user.getGender().equals("M")){
		        	  user.setGender("男");
		          }else{
		        	  user.setGender("女");
		          }
		           return  user;
		        }else{
		           return null;	
		        }
	}
	//admin进行用户的删除
	 public  boolean  adminDeleteUser(String  idsString){
		  String[]  idsArray =  idsString.split(",");
//System.out.println("传来的字符串是"+idsString);
		   for(int  i=0;i<idsArray.length;i++){
			          this.dao.adminDeleteUser(Integer.parseInt(idsArray[i]));
//System.out.println("被删除的用户是"+idsArray[i]);
		       }
		       return  true;
		   }
	 //admin进行用户的添加
	 public  boolean  adminAddUser(User  user){
		 this.dao.adminAddUser(user);
		 return  true;
	 }
}
