package org.nxum.medicine.controller;
import org.nxum.medicine.dao.UserDao;
import org.nxum.medicine.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping("/medicine")
public class CheckUserNameController {
@Autowired
private UserDao  dao;
@RequestMapping(value="checkUsername/{userName}",method=RequestMethod.GET)
@ResponseBody
public boolean  checkUser(@PathVariable("userName") String userName){
	 User user  =  new User(); 
	 user.setUserName(userName);
	 Integer check =  this.dao.existUserNameAndMobile(user);
	   if(check!=null){
		   return  true;
	   }
	      return false; 
    }
}
