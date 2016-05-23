package org.nxum.medicine.dao;
import java.util.List;

import org.nxum.medicine.entity.AdminComment;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.util.MybatisDao;
@MybatisDao
public interface AdminCommentDao {
	//查询所有的留言
 public  List<AdminComment>  adminFindComment(AdminPageBean   pageBean);
    //查询留言的条数
 public  Integer  adminCommentCount();
 //按用户的用户名进行搜索
 public  List<AdminComment> adminSeacherComment(String personName);
 //进行用户的留言回复
 public   void   adminReplyUser(AdminComment  adminComment);
 //进行用户的留言删除
 public  void  adminDeleteComment(Integer  id);
}
