package com.example.spring03.model.shop.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int product_num; //게시물번호
	private String product_name;//게시물 이름
	private String product_code;//게시물 코드
	private int product_price;//가격
	private String product_type; // 품목
	private String product_photo;//기본사진
	private String product_main_photo;//메인사진
	private String product_description;//설명
	private int product_amount; // 수량
	private String product_option1;//사이즈
	private String product_option2;//색상
	private MultipartFile file1;//첨부파일
	private MultipartFile file2;//첨부파일
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_photo() {
		return product_photo;
	}
	public void setProduct_photo(String product_photo) {
		this.product_photo = product_photo;
	}
	public String getProduct_main_photo() {
		return product_main_photo;
	}
	public void setProduct_main_photo(String product_main_photo) {
		this.product_main_photo = product_main_photo;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_option1() {
		return product_option1;
	}
	public void setProduct_option1(String product_option1) {
		this.product_option1 = product_option1;
	}
	public String getProduct_option2() {
		return product_option2;
	}
	public void setProduct_option2(String product_option2) {
		this.product_option2 = product_option2;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public int getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_num=" + product_num + ", product_name=" + product_name + ", product_code="
				+ product_code + ", product_price=" + product_price + ", product_type=" + product_type
				+ ", product_photo=" + product_photo + ", product_main_photo=" + product_main_photo
				+ ", product_description=" + product_description + ", product_amount=" + product_amount
				+ ", product_option1=" + product_option1 + ", product_option2=" + product_option2 + ", file1=" + file1
				+ ", file2=" + file2 + "]";
	}
	
}
