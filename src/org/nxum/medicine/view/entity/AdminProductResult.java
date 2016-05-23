package org.nxum.medicine.view.entity;
import java.sql.Date;
public class AdminProductResult {
	private  Integer productId;
	private  String  description;
	private  Integer  hot;
	private  Date hotTime;
	private  String  productName;
	private  Double  price;
	private  String  picture;
	private  String  specialPrice;
	private  Date    specialPriceTime;
	private Integer  stock;
	private  String  bigtypeName;
    private  String  smallTypeName;
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getHot() {
		return hot;
	}
	public void setHot(Integer hot) {
		this.hot = hot;
	}
	public Date getHotTime() {
		return hotTime;
	}
	public void setHotTime(Date hotTime) {
		this.hotTime = hotTime;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getSpecialPrice() {
		return specialPrice;
	}
	public void setSpecialPrice(String specialPrice) {
		this.specialPrice = specialPrice;
	}
	public Date getSpecialPriceTime() {
		return specialPriceTime;
	}
	public void setSpecialPriceTime(Date specialPriceTime) {
		this.specialPriceTime = specialPriceTime;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getBigtypeName() {
		return bigtypeName;
	}
	public void setBigtypeName(String bigtypeName) {
		this.bigtypeName = bigtypeName;
	}
	public String getSmallTypeName() {
		return smallTypeName;
	}
	public void setSmallTypeName(String smallTypeName) {
		this.smallTypeName = smallTypeName;
	}
	@Override
	public String toString() {
		return "AdminProductResult [productId=" + productId + ", description="
				+ description + ", hot=" + hot + ", hotTime=" + hotTime
				+ ", productName=" + productName + ", price=" + price
				+ ", picture=" + picture + ", specialPrice=" + specialPrice
				+ ", specialPriceTime=" + specialPriceTime + ", stock=" + stock
				+ ", bigtypeName=" + bigtypeName + ", smallTypeName="
				+ smallTypeName + "]";
	}
    
}
