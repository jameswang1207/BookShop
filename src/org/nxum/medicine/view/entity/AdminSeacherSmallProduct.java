package org.nxum.medicine.view.entity;

import org.nxum.medicine.entity.AdminPageBean;

public class AdminSeacherSmallProduct   extends  AdminPageBean{
   private String   smallProductName;

public String getSmallProductName() {
	return smallProductName;
}

public void setSmallProductName(String smallProductName) {
	this.smallProductName = smallProductName;
}

@Override
public String toString() {
	return "AdminSeacherSmallProduct [smallProductName=" + smallProductName
			+ "]";
}
   
}
