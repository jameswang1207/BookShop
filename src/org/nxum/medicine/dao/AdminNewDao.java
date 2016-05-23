package org.nxum.medicine.dao;
import java.util.List;
import org.nxum.medicine.entity.New;
import org.nxum.medicine.util.MybatisDao;
@MybatisDao
public interface AdminNewDao {
public  List<New>  adminFindNews();
public  Integer  adminGetNewsCount();

public  List<New> adminSeacherNews(String title);
public  Integer  adminSeacherNewsCount(String title);

public  void  adminDeleteNews(Integer  id);
public New  checkNewsRepeat(String title);

public  void adminAddNews(New  news);

public  void  adminUpdateNews(New  news);
}
