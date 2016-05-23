package org.nxum.medicine.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.nxum.medicine.dao.CommentDao;
import org.nxum.medicine.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/medicine")
public class SaveCommentController {
	@Autowired
	private CommentDao  dao ;
@RequestMapping(value="/saveComment",method=RequestMethod.POST)
public  String  saveComment(Comment comment){
	 //插入用户创建留言的时间
	 Date time  =  new  Date();
	 SimpleDateFormat  sim  =  new SimpleDateFormat("yyyy-MM-dd");
	 String  createTimesim = sim.format(time);
	 
	 comment.setCreateTime(java.sql.Date.valueOf(createTimesim));
	 this.dao.saveComment(comment);
	 return  "redirect:/medicine/toComment/1";
 }
}
