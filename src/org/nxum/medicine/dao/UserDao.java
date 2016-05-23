package org.nxum.medicine.dao;

import org.nxum.medicine.entity.User;
import org.nxum.medicine.util.MybatisDao;

@MybatisDao
public interface UserDao {
	// 用来保存用户信息
	public void saveUser(User user);

	// 用来判断用户是否存在通过用户名,邮箱,邮箱不能重复为可能找回密码
	public Integer existUserNameAndMobile(User user);

	// 用户登陆
	public User findByUserName(String username);

	// 更改user
	public void updateUser(User user);

}
