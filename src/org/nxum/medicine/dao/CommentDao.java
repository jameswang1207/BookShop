package org.nxum.medicine.dao;
import java.util.List;

import org.nxum.medicine.util.MybatisDao;
import org.nxum.medicine.entity.Comment;
@MybatisDao
public interface CommentDao {
   public  List<Comment> findAllComment(Comment comment); 
   public  Integer getCommentRowCount();
   //查入留言
   public  void  saveComment(Comment comment);
}
