package org.nxum.medicine.service;
import java.util.List;

import  org.nxum.medicine.entity.Notice;
public interface AdminNoticeService {
	//查询全部的Notice
 public  List<Notice> adminFindNotice();
    //查询notice的数量
 public  Integer adminGetNoticeCount();
   // 进行用户的seacher
 public  List<Notice>  adminSeacherNotice(String  noticeTilte);
 public  Integer   adminSeacherNoticeCount(String noticeTilte);
 //进行notice的删除
 public  boolean    adminDeleteNoticeById(String idsString);
 //进行Notice的添加
 public  boolean  adminAddNotice(Notice notice);
 //检测title是否重复
 public   boolean  adminCheckTitleRepeat(String title);
 //进行notice的修改
 public  boolean  adminUpdateNotice(Notice  notice);
}
