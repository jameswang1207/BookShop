package org.nxum.medicine.view.entity;
import  org.nxum.medicine.entity.AdminPageBean;
public class AdminSeacherBigProduct  extends AdminPageBean{
    private String bigProductName;

	public String getBigProductName() {
		return bigProductName;
	}

	public void setBigProductName(String bigProductName) {
		this.bigProductName = bigProductName;
	}

	@Override
	public String toString() {
		return "AdminSeacherBigProduct [bigProductName=" + bigProductName + "]";
	}
    
}
