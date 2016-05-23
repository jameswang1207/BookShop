package org.nxum.medicine.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class IndexController {
	@RequestMapping(value="/toIndex",method=RequestMethod.GET)
     public  String  toIndex(){
    	  return "index";
     }
}
