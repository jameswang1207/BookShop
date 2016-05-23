package org.nxum.medicine.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nxum.medicine.dao.UserDao;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.view.entity.ResultUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class LoginController {
 @Autowired	
 private UserDao  dao;	
 @RequestMapping(value="/toLogin",method=RequestMethod.GET)
	public  String toLogin(){
		 return "login";
	}
 @RequestMapping(value="/login",method=RequestMethod.POST)
 public  String  login(HttpServletRequest request,ResultUser userpara,ModelMap map){
	  User  user =  this.dao.findByUserName(userpara.getUserName());
      //该session只能从request哪里获得，而不能直接要一个session
       HttpSession  session  =  request.getSession();       
       if(!userpara.getCode().equals(session.getAttribute("code"))){
	       map.addAttribute("error","用户验证码输入错误!!");
	       map.addAttribute("Resultuser",userpara);
	       return "login";
       } else  if(user!=null){
		  if(user.getPassword().equals(userpara.getPassword())){
			  //将用户放入到session中
			  session.setAttribute("userLogin",user);
			  return "redirect:/medicine/toIndex";   
		  }
		      map.addAttribute("error","用户密码错误,请重新输入!");
		      map.addAttribute("Resultuser",userpara);
		      return  "login";
	       }else{
    	      map.addAttribute("error","用户名不存在，请重新输入!");
    	      map.addAttribute("Resultuser",userpara);
	          return  "login";
	  }
  }
}
