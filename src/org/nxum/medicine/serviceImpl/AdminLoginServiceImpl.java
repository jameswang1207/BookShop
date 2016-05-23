package org.nxum.medicine.serviceImpl;
import org.nxum.medicine.dao.AdminLoginDao;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.service.AdminLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("adminLoginService")
public class AdminLoginServiceImpl implements  AdminLoginService {
	@Autowired
	private AdminLoginDao  dao;
	@Override
	public User findByUserNameService(String userName) {
		    User  user  =  dao.findByAdminUser(userName);
		    if(user!=null && user.getStatus()==2){
		    	  return user;
		    }else{
		          return null;  	
		    }
	}
}
