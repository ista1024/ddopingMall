package com.example.spring03.service.member;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.spring03.model.member.dao.MemberDAO;
import com.example.spring03.model.member.dto.MemberDTO;
import com.example.spring03.model.order.dto.OrderDTO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO memberDao;
	@Inject
	JavaMailSender mailSender;

	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result=memberDao.loginCheck(dto);
		if(result) {//로그인 성공
			//세션변수에 값 저장
			MemberDTO dto2=viewMember(dto.getUserid());
			session.setAttribute("userno", dto2.getUserno());
			session.setAttribute("userid", dto2.getUserid());
			session.setAttribute("name", dto2.getName());
			session.setAttribute("passwd", dto2.getPasswd());
			session.setAttribute("email", dto2.getEmail());
			session.setAttribute("textemail", dto2.getTextemail());
			session.setAttribute("hp", dto2.getHp());
			session.setAttribute("hp2", dto2.getHp2());
			session.setAttribute("hp3", dto2.getHp3());
			session.setAttribute("postcode", dto2.getPostcode());
			session.setAttribute("address", dto2.getAddress());
			session.setAttribute("detailAddress", dto2.getDetailAddress());
			session.setAttribute("extraAddress", dto2.getExtraAddress());
			session.setAttribute("join_date", dto2.getJoin_date());
			if (dto2.getMember_verify() >= 2) {
				session.setAttribute("admin_userid", dto2.getUserid());
				session.setAttribute("member_verify", dto2.getMember_verify());
			}
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		//세션 초기화
		session.invalidate();
	}
	
	
	@Override
	public void join_check(MemberDTO dto) throws Exception{
		memberDao.join_check(dto);
	}
	
	@Override
	public MemberDTO viewMember(String userid) {
		return memberDao.viewMember(userid);
	}

	@Override
	public String idfindcheck(MemberDTO dto) {
		String result=memberDao.idfindcheck(dto);
	
		return result;
	}
	@Override
	public String passwdfindcheck(MemberDTO dto) {
		String result=memberDao.passwdfindcheck(dto);
	
		return result;
	}

	@Override
	public void updateMember(MemberDTO dto) throws Exception {
		// 받은 dto를 DAO로 보냄
		memberDao.updateMember(dto);
	}

	@Override
	public String idcheck(String userid) {
		return memberDao.idcheck(userid);
	}

	@Transactional
	@Override
	public String generateEmailVerifyNumber(String email) {
		String verifyNumber = "";
		for (int i = 0; i < 6; i++) {
			verifyNumber += (int) (Math.random() * 10);
		}
		System.out.println(verifyNumber);
		memberDao.generateEmailVerifyNumber(email, verifyNumber);
		try {
			// MimeMessage : 이메일 객체
			MimeMessage msg = mailSender.createMimeMessage();
			// 받는 사람 이메일주소
			msg.addRecipient(RecipientType.TO, new InternetAddress(email));
			// 보내는 사람(이메일주소 + 이름)
			msg.addFrom(new InternetAddress[] {
					new InternetAddress("ista2028@gmail.com", "DPM_관리자")
			});
			// 이메일 제목
			msg.setSubject("DPM 이메일 인증코드입니다.", "utf-8");
			// 이메일 본문
			msg.setText("인증코드 : " + verifyNumber, "utf-8");
			// 이메일 전송
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDao.getOrderNumber(email, verifyNumber);
	}

	@Transactional
	@Override
	public int emailVerify(int verifyOrder, int verifyNumber) {
		int result = 0;
		int numberCheck = memberDao.emailVerify(verifyOrder);
		if (numberCheck != verifyNumber) {
			result = -1;
		} else {
			result = 1;
			memberDao.deleteInvalidatedNum(verifyOrder);
		}
		return result;
	}

	@Override
	public OrderDTO orderMember(String userid) {
		return memberDao.orderMember(userid);
	}
	
	
}
