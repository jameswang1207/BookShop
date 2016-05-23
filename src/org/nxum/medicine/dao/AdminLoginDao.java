package org.nxum.medicine.dao;
import java.util.List;

import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.util.MybatisDao;
@MybatisDao
public interface AdminLoginDao {
   public  User findByAdminUser(String userName);
   
   //Admin管理用户
   public   List<User>  adminAllUser(AdminPageBean pageBean);
   //查询用户数据库中的总数据
   public   Integer   getAdminUserCount();
   //按用户名查找用户
   public   User   adminSearchUserName(String userName);
   //Admin删除选中的用户
   public   void  adminDeleteUser(Integer  id);
   //admin进行用户信息的添加
   public   void  adminAddUser(User user);
}
