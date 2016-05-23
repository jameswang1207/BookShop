package org.nxum.medicine.service;
import org.nxum.medicine.entity.User;
public interface AdminLoginService {
  public User  findByUserNameService(String userName);
}
