package org.nxum.medicine.controller;
import org.nxum.medicine.dao.UserDao;
import org.nxum.medicine.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class SaveUserController {
 @RequestMapping(value="/toRegister",method=RequestMethod.GET)
 public  String  toRegister(){
	 return "register";
 }
 @Autowired
 private UserDao  dao;
 @RequestMapping(value="/register",method=RequestMethod.POST)
 public String regiseter(User user,ModelMap map){
	   //进行数据的读入数据库
	    this.dao.saveUser(user);
	   return "register-result";
 }
}
