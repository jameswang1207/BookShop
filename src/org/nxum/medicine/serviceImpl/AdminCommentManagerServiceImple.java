package org.nxum.medicine.serviceImpl;
import java.util.List;
import org.nxum.medicine.dao.AdminCommentDao;
import org.nxum.medicine.entity.AdminComment;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.service.AdminCommentManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("adminCommentManagerService")
public class AdminCommentManagerServiceImple  implements AdminCommentManagerService{
	@Autowired
	private AdminCommentDao  dao;
	public AdminCommentDao getDao() {
		return dao;
	}

	public void setDao(AdminCommentDao dao) {
		this.dao = dao;
	}
	@Override
	public List<AdminComment> adminFindComment(Integer  page,Integer  rows) {
		   AdminPageBean    pageBean  =  new AdminPageBean();
		   pageBean.setPage(page);
		   pageBean.setRows(rows);
		   List<AdminComment>  comments =  this.dao.adminFindComment(pageBean);
		   if(comments.size()!=0){
			     return  comments;
		   }else{
			     return null;
		   }
	}

	@Override
	public Integer adminGetCommentCount() {
		     Integer  rows  =  this.dao.adminCommentCount();
		     return   rows;
	}

	@Override
	public List<AdminComment> adminSeacherComment(String personName) {
		   List<AdminComment>  comments 
		              = this.dao.adminSeacherComment(personName);
		    if(comments.size()!=0){
		    	      return   comments;
		    }else{
		    	       return  null;
		    }
	}
	@Override
	public   boolean adminReplyUser(AdminComment adminComment) {
		      this.dao.adminReplyUser(adminComment);
		      return  true;
	}

	@Override
	public boolean adminDeleteComment(String idString) {
	        String[]  idArrays =  idString.split(",");
	        for(int i=0;i<idArrays.length;i++){
	        	  this.dao.adminDeleteComment(Integer.parseInt(idArrays[i]));
	        }
		return   true;
	}
}
