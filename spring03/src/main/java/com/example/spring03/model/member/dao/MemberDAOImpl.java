package com.example.spring03.model.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.model.member.dto.MemberDTO;
import com.example.spring03.model.order.dto.OrderDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name=sqlSession.selectOne("member.login_check", dto);
		// 조건식 ? true일때 값 : false일때 값
		return (name==null) ? false : true;
	}

	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember", userid);
	}

	@Override
	public void join_check(MemberDTO dto) throws Exception {
		sqlSession.insert("member.join_check" ,dto);
	}

	@Override
	public String idfindcheck(MemberDTO dto) {
		String userid=sqlSession.selectOne("member.idfind", dto);
	return userid;
	}
	
	@Override
	public String passwdfindcheck(MemberDTO dto) {
		String userid=sqlSession.selectOne("member.passwdfind", dto);
	return userid;
	}

	@Override
	public void updateMember(MemberDTO dto) throws Exception {
		sqlSession.update("member.updateMember", dto);
	}

	@Override
	public List<MemberDTO> listAllMember() {
		return sqlSession.selectList("member.listAllMember");
	}

	@Override
	public String idcheck(String userid) {
		return sqlSession.selectOne("member.idcheck", userid);
	}

	@Override
	public void updateMemberByAdmin(MemberDTO dto) throws Exception {
		sqlSession.update("member.updateMemberByAdmin", dto);
	}

	@Override
	public void generateEmailVerifyNumber(String email, String verifyNumber) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("verifyNumber", verifyNumber);
		sqlSession.insert("member.generateEmailVerifyNumber", map);
	}

	@Override
	public String getOrderNumber(String email, String verifyNumber) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("verifyNumber", verifyNumber);
		return sqlSession.selectOne("member.getOrderNumber", map);
	}

	@Override
	public int emailVerify(int verifyOrder) {
		return sqlSession.selectOne("member.emailVerify", verifyOrder);
	}

	@Override
	public void deleteInvalidatedNum(int order_num) {
		sqlSession.update("member.deleteInvalidatedNum", order_num);
	}

	@Override
	public OrderDTO orderMember(String userid) {
		return sqlSession.selectOne("member.orderMember", userid);
	}
	
	
}
