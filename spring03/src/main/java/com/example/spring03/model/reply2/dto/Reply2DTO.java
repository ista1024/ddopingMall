package com.example.spring03.model.reply2.dto;

import java.util.Date;

public class Reply2DTO {
	
	private int rno;
	private int product_num;
	private String replytext;
	private String replyer;
	private Date regdate;
	private String name;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Reply2DTO [rno=" + rno + ", product_num=" + product_num + ", replytext=" + replytext + ", replyer="
				+ replyer + ", regdate=" + regdate + ", name=" + name + "]";
	}
	
	
	

}
