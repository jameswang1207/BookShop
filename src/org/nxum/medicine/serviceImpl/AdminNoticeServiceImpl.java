package org.nxum.medicine.serviceImpl;

import java.util.List;

import org.nxum.medicine.dao.AdminNoticeDao;
import org.nxum.medicine.entity.Notice;
import org.nxum.medicine.service.AdminNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("adminNoticeService")
public class AdminNoticeServiceImpl  implements  AdminNoticeService{
	@Autowired
    private  AdminNoticeDao  dao;
	  
	public AdminNoticeDao getDao() {
		return dao;
	}

	public void setDao(AdminNoticeDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Notice> adminFindNotice() {
		     List<Notice>  notices =
		    		  this.dao.adminFindNotice();
		       if(notices.size()!=0){
		    	      return   notices;
		       }else{
                      return  null;		    	   
		       }
	}

	@Override
	public Integer adminGetNoticeCount() {
		    Integer   total=     this.dao.adminGetNoticeCount();
	       	return   total;
	}

	@Override
	public List<Notice> adminSeacherNotice(String noticeTilte) {
		    List<Notice>  notices = 
		    		this.dao.adminSeacherNotice("%"+noticeTilte+"%");
		    if(notices.size()!=0){
		    	    return   notices;
		    }else{
		    	     return  null;
		    }
	}

	@Override
	public Integer adminSeacherNoticeCount(String noticeTilte) {
		           Integer   total  = 
		        		   this.dao.adminSeacherNoticeCount("%"+noticeTilte+"%");
	             	return   total;
	}

	@Override
	public boolean adminDeleteNoticeById(String idsString) {
		     String[]  idArrays =  idsString.split(",");
		    for(int i=0;i<idArrays.length;i++){
		    	    this.dao.adminDeleteNotice(Integer.parseInt(idArrays[i]));
		    }
		return  true;
	}

	@Override
	public boolean adminAddNotice(Notice notice) {
		     this.dao.adminAddNotice(notice);
		return   true;
	}

	@Override
	public boolean adminCheckTitleRepeat(String title) {
		  Notice  notice  =    this.dao.checkNoticeRepeat(title);
		    if(notice!=null){
		    	   return true;
		    }else{
		    	  return  false;
		    }
	}

	@Override
	public boolean adminUpdateNotice(Notice notice) {
		    this.dao.adminUpdateNotice(notice);
		return  true;
	}
}
