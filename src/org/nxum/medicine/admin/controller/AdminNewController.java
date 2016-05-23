package org.nxum.medicine.admin.controller;
import java.util.List;
import java.util.Map;

import org.nxum.medicine.entity.New;
import org.nxum.medicine.entity.util.SeacherNew;
import org.nxum.medicine.service.AdminNewService;
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
public class AdminNewController {
	@Autowired
	private AdminNewService  service;
	 
   @RequestMapping(value="/adminFindNew",method=RequestMethod.POST)
   @ResponseBody
	public  Map<String,Object>  adminFindNew(SeacherNew  seacherNew){
	          if(seacherNew.getTitle()==null||seacherNew.getTitle()==""){
	        	      List<New>  news  =    this.service.adminFindNews();
	        	      Integer   total  =  this.service.adminGetNewsCount();
	        	    Map<String,Object>  jsonMap = 
	        	    		   JsonResponseData.JsonMapResponse(news,total);
	        	      if(news.size()!=0){
	        	    	     return  jsonMap;
	        	      }else{
	        	    	     return  null;
	        	      }
	          }else{
	        	List<New>  news =  
	        			 this.service.adminSeacherNews(seacherNew.getTitle());
	        	Integer  total  = 
	        	          this.service.adminSeacherNewsCount(seacherNew.getTitle());
	        	Map<String,Object> jsonMap =  JsonResponseData.JsonMapResponse(news,total);
	        	if(news.size()!=0){
	        		   return  jsonMap;
	        	}else{
	        		  return  null;
	        	}
	          }
	}
   @RequestMapping(value="/adminDeleteNews/{idsString}",method=RequestMethod.DELETE)
   @ResponseBody
    public  boolean  adminDeleteNews(@PathVariable("idsString") String idsString){
    	     boolean  isDelete =
    	    		  this.service.adminDeleteNews(idsString);
    	     if(isDelete){
    	    	     return  true;
    	     }else{
    	    	    return  false;
    	     }
    }
   @RequestMapping(value="/adminCheckNewsRepeat/{title}",method=RequestMethod.GET)
   @ResponseBody
   public  boolean  adminCheckNewsTitle(@PathVariable("title") String title){
	          boolean  isRepeat
	                    = this.service.checkNewsRepeat(title);
	          if(isRepeat){
	        	     return  true;
	          }else{
	        	     return  false;
	          }
   }
   @RequestMapping(value="/adminAddNew",method=RequestMethod.POST)
   @ResponseBody
   public  boolean  adminAddNew(New news){
	       news.setCreateTime(DateUtil.getCurrentDateStrCreate());
	       boolean  isAdd =  this.service.adminAddNews(news);
	         if(isAdd){
	        	   return  true;
	         }else{
	        	   return  false;
	         }
   }
   @RequestMapping(value="/adminUpdateNew",method=RequestMethod.POST)
   @ResponseBody
   public  boolean  adminUpdateNews(New news){
	     news.setCreateTime(DateUtil.getCurrentDateStrCreate());
	     boolean  isUpdate  = 
	    		      this.service.adminUpdateNews(news);
	      if(isUpdate){
	    	        return  true;
	      }else{
	    	        return false;
	      }
   }
}




