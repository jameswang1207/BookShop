package org.nxum.medicine.view.entity;

import org.nxum.medicine.entity.AdminPageBean;

public class AdminSearchProductParamete extends  AdminPageBean {
   private String  productName;

public String getProductName() {
	return productName;
}

public void setProductName(String productName) {
	this.productName = productName;
}

@Override
public String toString() {
	return "AdminSearchProductParamete [productName=" + productName + "]";
}
   
}
