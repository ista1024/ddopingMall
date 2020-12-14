package com.example.spring03.model.member.dao;

import java.util.List;

import com.example.spring03.model.member.dto.MemberDTO;
import com.example.spring03.model.order.dto.OrderDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO dto);
	public MemberDTO viewMember(String userid);
	public void join_check(MemberDTO dto) throws Exception;//회원가입
	String idfindcheck(MemberDTO dto); //아이디 찾기
	String passwdfindcheck(MemberDTO dto); //비밀번호 찾기
	public void updateMember(MemberDTO dto) throws Exception;//회원정보 수정
	public List<MemberDTO> listAllMember(); // 전체 회원 리스트
	public String idcheck(String userid);  //아이디 중복 확인
	public void updateMemberByAdmin(MemberDTO dto) throws Exception;
	public void generateEmailVerifyNumber(String email, String verifyNumber);
	public String getOrderNumber(String email, String verifyNumber);
	public int emailVerify(int verifyOrder);
	public void deleteInvalidatedNum(int verifyOrder);
	public OrderDTO orderMember(String userid);
}
