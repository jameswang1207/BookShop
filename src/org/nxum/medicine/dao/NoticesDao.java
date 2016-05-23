package org.nxum.medicine.dao;
import java.util.List;

import org.nxum.medicine.entity.Notice;
import org.nxum.medicine.util.MybatisDao;
@MybatisDao
public interface NoticesDao {
  public List<Notice>  findAll();
  //公告的查询
  public Notice findByTitle(String  title);
}
