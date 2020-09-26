package com.ecomerce.entities;

public class Product {
	private int pId;
	private String pName;
	private String pDescription;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int pQuantity;
	private Category category;
	
	
	
	public Product() {}

	

	public Product(String pName, String pDescription, String pPhoto, int pPrice, int pDiscount, int pQuantity,
			Category category) {
		super();
		this.pName = pName;
		this.pDescription = pDescription;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}



	public int getpId() {
		return pId;
	}



	public void setpId(int pId) {
		this.pId = pId;
	}



	public String getpName() {
		return pName;
	}



	public void setpName(String pName) {
		this.pName = pName;
	}



	public String getpDescription() {
		return pDescription;
	}



	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}



	public String getpPhoto() {
		return pPhoto;
	}



	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}



	public int getpPrice() {
		return pPrice;
	}



	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}



	public int getpDiscount() {
		return pDiscount;
	}



	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}



	public int getpQuantity() {
		return pQuantity;
	}



	public void setpQuantity(int pQuality) {
		this.pQuantity = pQuality;
	}



	public Category getcategory() {
		return category;
	}



	public void setcId(Category category) {
		this.category = category;
	}
	
	
	

}
