package org.nxum.medicine.admin.controller;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.nxum.medicine.dao.MedicineBigTypeDao;
import org.nxum.medicine.dao.MedicineSmallTypeDao;
import org.nxum.medicine.dao.NavigationDao;
import org.nxum.medicine.dao.NewDao;
import org.nxum.medicine.dao.NoticesDao;
import org.nxum.medicine.dao.ProductDao;
import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.entity.Navigation;
import org.nxum.medicine.entity.New;
import org.nxum.medicine.entity.Notice;
import org.nxum.medicine.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
@RequestMapping("/Admin")
@Controller
public class SystemRefrsehController {
	//商品大类的加载
	@Autowired
	private MedicineBigTypeDao  bigTypeDao;
	//商品小类的加载
	@Autowired
	private  MedicineSmallTypeDao  smallTypeDao;
	//公告的加载
	@Autowired
	private  NoticesDao  noticeDao;
	//新闻的加载
	@Autowired
	private NewDao   newDao;
	//导航的加载
	@Autowired
	private NavigationDao natviationDao;
	//商品的加载
	@Autowired
	private ProductDao  productDao;
	@RequestMapping(value="/adminRefresh",method=RequestMethod.GET)
	@ResponseBody
	public    boolean   adminSystemRefresh(HttpServletRequest request){
    ServletContext  application =   request.getSession().getServletContext();
    
	 List<MedicineBigType>  bigType =  this.bigTypeDao.findAll();
	 application.setAttribute("bigtypes",bigType);
//System.out.println("商品大类重新刷新完毕");
       
	   
 	  List<MedicineSmalltype>  smallTypes = this.smallTypeDao.findAll();
 	  application.setAttribute("smallTypes", smallTypes);
//System.out.println("商品小类加载完毕");
 	  
 	  List<Navigation>  navigations = this.natviationDao.findAll();
 	  application.setAttribute("navigations", navigations);
//System.out.println("navigation加载完毕"+navigations);
 	  
 	  List<Notice>  notices =     this.noticeDao.findAll();
 	  application.setAttribute("notices", notices);
 //System.out.println("notices加载完毕");
 	  
 	  List<New>  news =  this.newDao.findAll();
 	  application.setAttribute("news", news);
//System.out.println("news加载完毕");
 	  
 	  List<Product>  hots=  this.productDao.findHotAll();
 	  application.setAttribute("hots", hots);
 //System.out.println("hots加载完毕");
 	  
 	  List<Product>  specials= this.productDao.findSpricalAll();
 	  application.setAttribute("specials", specials);
//System.out.println("specials加载完毕");
	  return  true;
	  } 
}
