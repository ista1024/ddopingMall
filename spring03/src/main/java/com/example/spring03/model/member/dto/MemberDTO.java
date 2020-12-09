package com.example.spring03.model.member.dto;

import java.util.Date;

public class MemberDTO {
	private int userno;
	private String userid;
	private String passwd;
	private String name;
	private String hp;
	private String hp2;
	private String hp3;
	private String email;
	private String textemail;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private Date join_date;
	private int member_rank;
	private int member_verify;
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTextemail() {
		return textemail;
	}
	public void setTextemail(String textemail) {
		this.textemail = textemail;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
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
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public int getMember_rank() {
		return member_rank;
	}
	public void setMember_rank(int member_rank) {
		this.member_rank = member_rank;
	}
	public int getMember_verify() {
		return member_verify;
	}
	public void setMember_verify(int member_verify) {
		this.member_verify = member_verify;
	}
	@Override
	public String toString() {
		return "MemberDTO [userno=" + userno + ", userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", hp="
				+ hp + ", hp2=" + hp2 + ", hp3=" + hp3 + ", email=" + email + ", textemail=" + textemail + ", postcode="
				+ postcode + ", address=" + address + ", detailAddress=" + detailAddress + ", extraAddress="
				+ extraAddress + ", join_date=" + join_date + ", member_rank=" + member_rank + ", member_verify="
				+ member_verify + "]";
	}
	
	
	
}
