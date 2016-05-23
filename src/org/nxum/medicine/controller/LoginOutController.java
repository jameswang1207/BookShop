package org.nxum.medicine.controller;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class LoginOutController {
	@RequestMapping(value="/logout",method=RequestMethod.GET)
public  String  logout(HttpServletRequest request){
		//清空当前的session中的值,就此可以退出到没登陆之前
	    request.getSession().invalidate();
	return  "redirect:/medicine/toIndex";
 }
}
