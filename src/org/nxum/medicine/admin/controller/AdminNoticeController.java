package org.nxum.medicine.admin.controller;

import java.util.List;
import java.util.Map;
import org.nxum.medicine.entity.Notice;
import org.nxum.medicine.entity.util.SeacherNotice;
import org.nxum.medicine.service.AdminNoticeService;
import org.nxum.medicine.util.DateUtil;
import org.nxum.medicine.util.JsonResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
@RequestMapping("/Admin")
@Controller
public class AdminNoticeController {
     @Autowired
	 private AdminNoticeService   service;
    public AdminNoticeService getService() {
		return service;
	}

	public void setService(AdminNoticeService service) {
		this.service = service;
	}
    @RequestMapping(value="/adminFindNotice",method=RequestMethod.POST)
    @ResponseBody
	public  Map<String,Object>   adminFindNotice(SeacherNotice  notice){
		     if(notice.getTitle()==null||notice.getTitle()==""){
		    	     List<Notice>  notices = this.service.adminFindNotice();
		             Integer  total   =  this.service.adminGetNoticeCount();
		             Map<String,Object>  jsonMap= 
		                		JsonResponseData.JsonMapResponse(notices,total);
		               if(notices.size()!=0){
		            	       return jsonMap;
		               }else{
		            	       return  null;
		               }
		         }else{
		    	   List<Notice>  notices  =  
		    			 this.service.adminSeacherNotice(notice.getTitle());
		    	  Integer   count  = 
		    			 this.service.adminSeacherNoticeCount(notice.getTitle());
		    	  Map<String,Object>  jsonMap =  JsonResponseData.JsonMapResponse(notices,count);
		    	  if(notices.size()!=0){
		    		      return jsonMap;
		    	  }else{
		    		     return  null;
		    	  }
		     }
    }
    @RequestMapping(value="/adminDeleteNotice/{idsString}",method=RequestMethod.DELETE)
    @ResponseBody
    public  boolean  adminDeleteNotice(@PathVariable("idsString") String idsString){
    	     boolean  isDelete =  
    			              this.service.adminDeleteNoticeById(idsString);
    	          if(isDelete){
    	        	     return  true;
    	          }else{
    	        	     return  false;
    	          }
    }
    //进行用户Notices的添加
    @RequestMapping(value="/adminInsertNotice",method=RequestMethod.POST)
    @ResponseBody
    public    boolean  adminAddNotice(Notice notice){
    	    notice.setCreateTime(DateUtil.getCurrentDateStrCreate());
    	    boolean  isAdd =  this.service.adminAddNotice(notice);
    	      if(isAdd){
    	    	     return  true;
    	      }else{
    	    	    return  false;
    	      }
    }
    //title的重复检测
    @RequestMapping(value="/adminCheckTitleRepeat/{title}",method=RequestMethod.GET)
    @ResponseBody
    public   boolean   checkTitleRepeat(@PathVariable("title") String  title){
    	     boolean  isRepeat  = this.service.adminCheckTitleRepeat(title);
    	        if(isRepeat){
    	        	   return true;
    	        }else{
    	        	   return  false;
    	        }  
    }
    //进行notice的修改
    @RequestMapping(value="/adminUpdateNotice",method=RequestMethod.POST)
    @ResponseBody
    public  boolean  adminUpdateNotice(Notice  notice){
    	       notice.setCreateTime(DateUtil.getCurrentDateStrCreate());
    	       boolean  isUpdate  =  
    	    		   this.service.adminUpdateNotice(notice);
    	       if(isUpdate){
    	    	     return  true;
    	       }else{
    	    	     return  false;
    	       }
    }
}
