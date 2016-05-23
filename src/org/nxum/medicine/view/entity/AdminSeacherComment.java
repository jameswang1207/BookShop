package org.nxum.medicine.view.entity;

import org.nxum.medicine.entity.AdminPageBean;

public class AdminSeacherComment extends AdminPageBean {
private String  personName;

public String getPersonName() {
	return personName;
}

public void setPersonName(String personName) {
	this.personName = personName;
}

@Override
public String toString() {
	return "AdminSeacherComment [personName=" + personName + "]";
}

}
