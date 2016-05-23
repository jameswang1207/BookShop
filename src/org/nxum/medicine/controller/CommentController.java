package org.nxum.medicine.controller;
import java.util.List;
import org.nxum.medicine.entity.Comment;
import org.nxum.medicine.util.NavigationUtil;
import org.nxum.medicine.dao.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/medicine")
public class CommentController {
private static  final  Integer  pageSize=3; 
@Autowired
private CommentDao  dao;
@RequestMapping(value="toComment/{pageNow}",method=RequestMethod.GET)
 public  String  toComment(@PathVariable Integer pageNow, ModelMap map){
	Integer  rowCount = this.dao.getCommentRowCount();
	Comment  comment  =  new Comment();
	comment.setPageSize(pageSize);
	comment.setPageNow(pageNow);
	Integer  pageCount  = 
			rowCount%comment.getPageSize()==0?rowCount/comment.getPageSize():rowCount/comment.getPageSize()+1 ;  
	comment.setPageCount(pageCount);
	String  navUtil =NavigationUtil.genNavCode("留言");
	List<Comment>  comments  = this.dao.findAllComment(comment);
	map.addAttribute("comments",comments);
	map.addAttribute("comment",comment);
	map.addAttribute("navUtil",navUtil);
	return  "comment";
 }
}
