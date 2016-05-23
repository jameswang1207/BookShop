package org.nxum.medicine.view.entity;

public class AdminSmallProductResult {
  private String  smallProductName;
  private String  bigProductName;
  private Integer smallProductId;
  private String  smallProductRemarks;
public String getSmallProductName() {
	return smallProductName;
}
public void setSmallProductName(String smallProductName) {
	this.smallProductName = smallProductName;
}
public String getBigProductName() {
	return bigProductName;
}
public void setBigProductName(String bigProductName) {
	this.bigProductName = bigProductName;
}
public Integer getSmallProductId() {
	return smallProductId;
}
public void setSmallProductId(Integer smallProductId) {
	this.smallProductId = smallProductId;
}
public String getSmallProductRemarks() {
	return smallProductRemarks;
}
public void setSmallProductRemarks(String smallProductRemarks) {
	this.smallProductRemarks = smallProductRemarks;
}
@Override
public String toString() {
	return "AdminSmallProductResult [smallProductName=" + smallProductName
			+ ", bigProductName=" + bigProductName + ", smallProductId="
			+ smallProductId + ", smallProductRemarks=" + smallProductRemarks
			+ "]";
}
  
  
  
}
