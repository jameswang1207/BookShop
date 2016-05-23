package org.nxum.medicine.dao;
import java.util.List;
import org.nxum.medicine.entity.New;
import org.nxum.medicine.util.MybatisDao;
@MybatisDao
public interface NewDao {
   public List<New> findAll();
   //新闻查询
   public New   findByTitle(String  title);
}
