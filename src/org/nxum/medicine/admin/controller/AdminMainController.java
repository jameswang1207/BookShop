package org.nxum.medicine.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/Admin")
public class AdminMainController {
    @RequestMapping(value="/toMain",method=RequestMethod.GET)
	public String   adminMain(){
    	   return "adminBookMain";
    }
    
    @RequestMapping(value="/toCall",method=RequestMethod.GET)
   	public String   adminCallMe(){
       	   return "AdminCallMe";
       }
    
    @RequestMapping(value="/toHelp",method=RequestMethod.GET)
   	public String   meHelpAdmin(){
       	   return "MeHelpAdmin";
       }
}
