package org.nxum.medicine.util;

import java.text.SimpleDateFormat;
import java.util.*;

public class DateUtil {
	public static String getCurrentDateStr(){
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		return sdf.format(date);
	}
	
	public  static  java.sql.Date  getCurrentDateStrCreate(){
		Date   date  =  new  Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String createDate =   sdf.format(date);
		return  java.sql.Date.valueOf(createDate);
	}
}
