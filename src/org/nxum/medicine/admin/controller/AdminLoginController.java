package org.nxum.medicine.admin.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nxum.medicine.entity.User;
import org.nxum.medicine.service.AdminLoginService;
import org.nxum.medicine.view.entity.ResultUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/Admin")
public class AdminLoginController {
	@RequestMapping(value="/toLogin",method=RequestMethod.GET)
    public  String  adminToLogin(){
    	      return "adminBookLogin";
    }
	
	@Autowired
	private  AdminLoginService service;
	public void setService(AdminLoginService service) {
		this.service = service;
	}
	@RequestMapping(value="/adminLogin",method=RequestMethod.POST)
	public String adminLogin(HttpServletRequest request,ResultUser userparam,ModelMap map){
		   User  user =   service.findByUserNameService(userparam.getUserName()); 
		      HttpSession  session  =  request.getSession();       
		       if(!userparam.getCode().equals(session.getAttribute("code"))){
			       map.addAttribute("error","用户验证码输入错误!");
			       map.addAttribute("Resultuser",userparam);
			       return "adminBookLogin";
		       } else  if(user!=null){
				  if(user.getPassword().equals(userparam.getPassword())){
					  //将用户放入到session中
					  session.setAttribute("userLogin",user);
					  return "redirect:/Admin/toMain";   
				  }
				      map.addAttribute("error","用户密码错误,请重新输入!");
				      map.addAttribute("Resultuser",userparam);
				      return  "adminBookLogin";
			       }else{
		    	      map.addAttribute("error","用户名不存在，请重新输入!");
		    	      map.addAttribute("Resultuser",userparam);
			          return  "adminBookLogin";
			  }	   
   }
}