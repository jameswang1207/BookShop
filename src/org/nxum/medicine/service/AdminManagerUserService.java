package org.nxum.medicine.service;

import java.util.List;

import org.nxum.medicine.entity.User;

public interface AdminManagerUserService {
      public  List<User>  adminManagerUserService(Integer page,Integer rows);
      
      //查询用户的总个数
      public  Integer   getAdminUserCountService();
      //按用户名查找用户
     public  User  adminsSearchUser(String  userName);
     //admin删除用户
     public  boolean  adminDeleteUser(String  idsString);
     //admin添加用户信息
     public  boolean  adminAddUser(User  user);
}
