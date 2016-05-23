package org.nxum.medicine.controller;
import org.nxum.medicine.dao.NoticesDao;
import org.nxum.medicine.entity.Notice;
import org.nxum.medicine.util.NavigationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class NoticesController {
  @Autowired
  private NoticesDao dao;
  @RequestMapping(value="toNotices/{title}",method=RequestMethod.GET)
  public  String  toNews(@PathVariable("title") String title,ModelMap map){
	         Notice  notice  =  this.dao.findByTitle(title);
	         String navUtil =NavigationUtil.genNavCode("公告");
	         map.addAttribute("navUtil",navUtil);
	         map.addAttribute("notice",notice);
	         map.addAttribute("pageView","../notice/noticeDetails.jsp");
	   return "newsMain";
  }
}
