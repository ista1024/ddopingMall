package com.example.spring03.service.member;

import javax.servlet.http.HttpSession;

import com.example.spring03.model.member.dto.MemberDTO;

public interface MemberService {
	public boolean loginCheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public void join_check(MemberDTO dto) throws Exception;
	public MemberDTO viewMember(String userid);
	String idfindcheck(MemberDTO dto);
	String passwdfindcheck(MemberDTO dto);
	
	public void updateMember(MemberDTO dto) throws Exception;//회원정보 수정
	public String idcheck(String userid);
	public String generateEmailVerifyNumber(String email);
	public int emailVerify(int verifyOrder, int verifyNumber);
}
