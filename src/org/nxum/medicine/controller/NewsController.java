package org.nxum.medicine.controller;
import org.nxum.medicine.dao.NewDao;
import org.nxum.medicine.entity.New;
import org.nxum.medicine.util.NavigationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class NewsController {
  @Autowired
  private NewDao  dao;
  @RequestMapping(value="toNews/{title}",method=RequestMethod.GET)
  public  String  toNews(@PathVariable("title") String title,ModelMap map){
	         New news =  dao.findByTitle(title);
	         String navUtil =NavigationUtil.genNavCode("新闻");
	         map.addAttribute("navUtil",navUtil);
	         map.addAttribute("news",news);
	         map.addAttribute("pageView","../news/newsDetails.jsp");
	   return "newsMain";
  }
}
