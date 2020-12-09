package com.example.spring03.model.board.dto;

import java.util.Arrays;
import java.util.Date;


public class BoardDTO {
	private int bno;
	private String userid;
	private String subject;
	private Date reg_date;
	private int readcount;
	private String content;
	private int cnt;//댓글 갯수
	private String show; //화면 표시 여부
	private String[] files;
	private int viewcnt;
	private String name; //작성자 이름
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", userid=" + userid + ", subject=" + subject + ", reg_date=" + reg_date
				+ ", readcount=" + readcount + ", content=" + content + ", cnt=" + cnt + ", show=" + show + ", files="
				+ Arrays.toString(files) + ", viewcnt=" + viewcnt + ", name=" + name + "]";
	}
	
	
	
	
}
