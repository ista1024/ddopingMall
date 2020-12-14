package com.example.spring03.model.order.dto;

public class OrderDTO {
	private String orderId;
	private String userid;
	private String orderRec;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String orderPhon;
	private String hp;
	private String hp2;
	private String hp3;
	private int amount;
	private String name;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getuserid() {
		return userid;
	}
	public void setuserid(String userid) {
		this.userid = userid;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public String getOrderPhon() {
		return orderPhon;
	}
	public void setOrderPhon(String orderPhon) {
		this.orderPhon = orderPhon;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	@Override
	public String toString() {
		return "OrderDTO [orderId=" + orderId + ", userid=" + userid + ", orderRec=" + orderRec + ", address=" + address
				+ ", detailAddress=" + detailAddress + ", extraAddress=" + extraAddress + ", orderPhon=" + orderPhon
				+ ", hp=" + hp + ", hp2=" + hp2 + ", hp3=" + hp3 + ", amount=" + amount + ", name=" + name + "]";
	}
	
	

}
