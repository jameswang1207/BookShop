package org.nxum.medicine.dao;

import java.util.List;

import org.nxum.medicine.util.MybatisDao;
import  org.nxum.medicine.entity.Navigation;
@MybatisDao
public interface NavigationDao {
 public  List<Navigation>  findAll();
}
