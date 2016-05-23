package org.nxum.medicine.dao;
import java.util.List;
import org.nxum.medicine.entity.Notice;
import org.nxum.medicine.util.MybatisDao;
@MybatisDao
public interface AdminNoticeDao {
  public  List<Notice>  adminFindNotice();
  public  Integer  adminGetNoticeCount();
  
  //admin进行相关的搜索
   public  List<Notice>  adminSeacherNotice(String notice);
   public  Integer   adminSeacherNoticeCount(String notice);
   
   //进行notice的删除
   public  void  adminDeleteNotice(Integer  id);
   //进行用户的notice的插入
   public  void  adminAddNotice(Notice  notice);
   //检测title是否重复
   public  Notice  checkNoticeRepeat(String title);
   //进行公告的修改
   public  void  adminUpdateNotice(Notice notice);
}
