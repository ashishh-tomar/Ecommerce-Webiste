package com.ecomerce.entities;

public class Product {
	private int pId;
	private String pTitle;
	private String pDescription;
	private String pPhoto;
	private double pPrice;
	private float pDiscount;
	private String pQuality;
	private Category category;
	
	
	
	public Product() {}

	

	public Product(String pTitle, String pDescription, String pPhoto, double pPrice, float pDiscount, String pQuality,
			Category category) {
		super();
		this.pTitle = pTitle;
		this.pDescription = pDescription;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuality = pQuality;
		this.category = category;
	}



	public int getpId() {
		return pId;
	}



	public void setpId(int pId) {
		this.pId = pId;
	}



	public String getpTitle() {
		return pTitle;
	}



	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
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



	public double getpPrice() {
		return pPrice;
	}



	public void setpPrice(double pPrice) {
		this.pPrice = pPrice;
	}



	public float getpDiscount() {
		return pDiscount;
	}



	public void setpDiscount(float pDiscount) {
		this.pDiscount = pDiscount;
	}



	public String getpQuality() {
		return pQuality;
	}



	public void setpQuality(String pQuality) {
		this.pQuality = pQuality;
	}



	public int getcategory() {
		return category;
	}



	public void setcId(Category category) {
		this.category = category;
	}
	
	
	

}
