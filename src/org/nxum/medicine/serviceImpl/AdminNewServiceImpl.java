package org.nxum.medicine.serviceImpl;

import java.util.List;

import org.nxum.medicine.dao.AdminNewDao;
import org.nxum.medicine.entity.New;
import org.nxum.medicine.service.AdminNewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("adminNewService")
public class AdminNewServiceImpl  implements AdminNewService{
	@Autowired
    private AdminNewDao  dao;
	
	public AdminNewDao getDao() {
		return dao;
	}

	public void setDao(AdminNewDao dao) {
		this.dao = dao;
	}

	@Override
	public List<New> adminFindNews() {
		    List<New>  news =  this.dao.adminFindNews();
		    if(news.size()!=0){
		    	  return  news;
		    }else{
		    	  return  null;
		    }
	}

	@Override
	public Integer adminGetNewsCount() {
		  Integer  total =  this.dao.adminGetNewsCount();
		return   total;
	}

	@Override
	public List<New> adminSeacherNews(String title) {
		  List<New>  news = this.dao.adminSeacherNews("%"+title+"%");
		    if(news.size()!=0){
		    	   return  news;
		    }else{
		    	   return  null;
		    }
	}

	@Override
	public Integer adminSeacherNewsCount(String title) {
		 Integer  total =    this.dao.adminSeacherNewsCount("%"+title+"%");
		return   total;
	}

	@Override
	public boolean adminDeleteNews(String idsString) {
		     String[]  idArrays  = idsString.split(",");
		     for(int i=0;i<idArrays.length;i++){
		    	   this.dao.adminDeleteNews(Integer.parseInt(idArrays[i]));
		     }
		return   true;
	}

	@Override
	public boolean checkNewsRepeat(String title) {
		   New  news  = this.dao.checkNewsRepeat(title);
		    if(news!=null){
		    	  return  true;
		    }else{
		    	  return  false;
		    }
	}

	@Override
	public boolean adminAddNews(New news) {
		     this.dao.adminAddNews(news);
		return   true;
	}

	@Override
	public boolean adminUpdateNews(New news) {
		  this.dao.adminUpdateNews(news);
		return   true;
	}

}
