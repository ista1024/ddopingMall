package com.example.spring03.model.shop.dto;

public class ProductImageDTO {
	
	private String product_num;
	private String product_photoUrl;
	public String getProduct_num() {
		return product_num;
	}
	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}
	public String getProduct_photoUrl() {
		return product_photoUrl;
	}
	public void setProduct_photoUrl(String product_photoUrl) {
		this.product_photoUrl = product_photoUrl;
	}
	@Override
	public String toString() {
		return "ProductImageDTO [product_num=" + product_num + ", product_photoUrl=" + product_photoUrl + "]";
	}
	
	
	
	

}
