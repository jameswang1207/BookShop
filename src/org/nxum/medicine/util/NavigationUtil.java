package org.nxum.medicine.util;
public class NavigationUtil {
	public static String genNavCode(String subName){	
		StringBuffer navigationCode=new StringBuffer();
		navigationCode.append("回到");
		navigationCode.append("&gt; ");
		navigationCode.append("<a href='/BookShop/medicine/toIndex'>首页</a>&nbsp;");
		navigationCode.append("&gt; ");
		navigationCode.append(subName);
		return navigationCode.toString();
	}
}
