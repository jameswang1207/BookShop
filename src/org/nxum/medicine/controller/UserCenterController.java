package org.nxum.medicine.controller;
import javax.servlet.http.HttpServletRequest;

import org.nxum.medicine.dao.UserDao;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.util.NavigationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class UserCenterController {
	@Autowired
	private UserDao  dao;
@RequestMapping(value="/toUserCenter",method=RequestMethod.GET)
  public  String  toUserCenter(ModelMap  map){
	  String  naviUtil =  NavigationUtil.genNavCode("个人中心");
	  map.addAttribute("naviUtil", naviUtil);
	  map.addAttribute("pageView","../user/userDefault.jsp");
	 return "user";
  }
 @RequestMapping(value="/lookAtUser",method=RequestMethod.GET)
  public String  LookAtOnself(ModelMap map){
	    String  naviUtil =  NavigationUtil.genNavCode("个人中心");
	    map.addAttribute("naviUtil", naviUtil);
	    map.addAttribute("pageView","../user/userInformation.jsp");
	    return  "user";
  }
  @RequestMapping(value="/toUpdate",method=RequestMethod.GET)
  public  String  toUpdateUser(ModelMap map,HttpServletRequest request){
	    String  naviUtil =  NavigationUtil.genNavCode("个人中心");
	    map.addAttribute("naviUtil", naviUtil);
	    
	    User   user  = (User)request.getSession().getAttribute("userLogin"); 
	    map.addAttribute("user",user);
	    map.addAttribute("pageView","../user/userUpdate.jsp");
	    return  "user";
  }
 @RequestMapping(value="/updateUser",method=RequestMethod.PUT)
  public  String  UpdateUser(User user,HttpServletRequest request){
	    //进行数据库的跟新
	    this.dao.updateUser(user);
	    //先跟新session中的值
	    request.getSession().setAttribute("userLogin",user);
	 return  "redirect:/medicine/lookAtUser"; 
  }
}
