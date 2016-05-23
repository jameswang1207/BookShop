package org.nxum.medicine.service;
import java.util.List;
import org.nxum.medicine.entity.New;
public interface AdminNewService {
	public  List<New>  adminFindNews();
	public  Integer  adminGetNewsCount();

	public  List<New> adminSeacherNews(String title);
	public  Integer  adminSeacherNewsCount(String title);

	public  boolean    adminDeleteNews(String  idsString);
	public   boolean  checkNewsRepeat(String title);

	public boolean adminAddNews(New  news);

	public   boolean  adminUpdateNews(New  news);
}
