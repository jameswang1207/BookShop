package org.nxum.medicine.serviceImpl;

import org.nxum.medicine.dao.AdminSystemDao;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.service.AdminSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminSystemService")
public class AdminSystemServiceImpl  implements  AdminSystemService {
	@Autowired
    private  AdminSystemDao  dao;
	@Override
	public boolean adminUpdatePassword(String password) {
		   User  admin =  this.dao.confirmOldPassword(password);
		   if(admin!=null){
			       return true;
		   }else{
			       return  false;
		   }
	}
	@Override
	public boolean adminModifyPassword(String password) {
		 this.dao.adminUpdatePassword(password);
		 return   true;
	}
}
