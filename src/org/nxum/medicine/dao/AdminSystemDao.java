package org.nxum.medicine.dao;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.util.MybatisDao;
@MybatisDao
public interface AdminSystemDao {
	public User  confirmOldPassword(String password);
	public void  adminUpdatePassword(String  password); 
}
