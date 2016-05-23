package org.nxum.medicine.controller;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
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
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
@Component
public class InitController implements ServletContextListener,ApplicationContextAware{
//以接口的形式将ApplicationContext注入进来，降低代码间的耦合度
    private static  ApplicationContext  applicationContext;
	@SuppressWarnings("static-access")
	@Override
	public void setApplicationContext(ApplicationContext applicationContext )
			throws BeansException {
		    this.applicationContext = applicationContext; 
	}
	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
	  ServletContext application= servletContextEvent.getServletContext();
//将商品大类加入到application中
	  MedicineBigTypeDao    bigTypeDao =  applicationContext.getBean("medicineBigTypeDao",MedicineBigTypeDao.class);
	  List<MedicineBigType>  bigTypes= bigTypeDao.findAll();
	  application.setAttribute("bigtypes",bigTypes);
//System.out.println("商品大类信息初始化完毕"+ bigTypes);
	  
//商品小类加入到application中 
	  MedicineSmallTypeDao smallTypeDao  = applicationContext.getBean("medicineSmallTypeDao",MedicineSmallTypeDao.class);
	  List<MedicineSmalltype>  smallTypes =  smallTypeDao.findAll();
	  application.setAttribute("smallTypes", smallTypes);
//System.out.println("商品小类加载完毕"+smallTypes);
	  
//navigation加入application中 
	  NavigationDao navigationDao  = applicationContext.getBean("navigationDao",NavigationDao.class);
	  List<Navigation>  navigations =  navigationDao.findAll();
	  application.setAttribute("navigations", navigations);
//System.out.println("navigation加载完毕"+navigations);
	  
//notices加入到application中
	  NoticesDao noticesDao  = applicationContext.getBean("noticesDao",NoticesDao.class);
	  List<Notice>  notices =  noticesDao.findAll();
	  application.setAttribute("notices", notices);
//System.out.println("notices加载完毕"+notices);
	  
//将新闻加入到application中
	  NewDao newDao= applicationContext.getBean("newDao",NewDao.class);
	  List<New>  news =  newDao.findAll();
	  application.setAttribute("news", news);
//System.out.println("news加载完毕"+news);
	  
//将今日特价加入到application中
	  ProductDao productDao= applicationContext.getBean("productDao",ProductDao.class);
	  List<Product>  hots=  productDao.findHotAll();
	  application.setAttribute("hots", hots);
//System.out.println("hots加载完毕"+hots);
	  
	  List<Product>  specials=  productDao.findSpricalAll();
	  application.setAttribute("specials", specials);
//System.out.println("specials加载完毕"+specials);
	}
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("进行销毁");
	}
}
