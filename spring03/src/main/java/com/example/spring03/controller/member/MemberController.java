package com.example.spring03.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring03.model.member.dto.MemberDTO;
import com.example.spring03.service.member.MemberService;

@Controller
@RequestMapping("member/*") //공통 url mapping
public class MemberController {
	//로깅처리
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping("login.do") //세부 url
	public String login() {
		return "member/login"; //login.jsp로 이동
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
		//로그인 성공 true, 실패 false
		boolean result=memberService.loginCheck(dto, session);
		ModelAndView mav=new ModelAndView();
		if(result) {//로그인 성공
			mav.setViewName("redirect:/main/home.do");
		}else {//로그인 실패
			mav.setViewName("member/login");
			//뷰에 전달할 값
			mav.addObject("message", "error");
		}
		return mav;
	}//login_check()
	
	//아이디 찾기
	@RequestMapping("idFind.do") 
	public String idfind() {
		return "member/idfind"; //
	}
	
	@RequestMapping("idFindCheck.do")
	public ModelAndView idFindCheck(MemberDTO dto) {
		String result=memberService.idfindcheck(dto);
		ModelAndView mav=new ModelAndView();
		if(result != null) {//로그인 성공
			mav.setViewName("member/idfind_result");
			mav.addObject("result", result); //전달할 데이터
		}else {//로그인 실패
			mav.setViewName("member/idfind_result1");
			mav.addObject("result", "정보가 다릅니다."); //전달할 데이터
			//뷰에 전달할 값
		}
		return mav;
	}
	
	//비밀번호 찾기
	@RequestMapping("passwdFind.do") 
	public String passwdfind() {
		return "member/passwdfind"; 
	}
	
	@RequestMapping("passwdFindCheck.do")
	public ModelAndView passwdFindCheck(MemberDTO dto) {
		String result=memberService.passwdfindcheck(dto);
		ModelAndView mav=new ModelAndView("/passwdfind");
		if(result != null) {//로그인 성공
			mav.setViewName("member/passwdfind_result");
			mav.addObject("result", result); //전달할 데이터
		}else {//로그인 실패
			mav.setViewName("member/passwdfind_result1");
			mav.addObject("result", "정보가 다릅니다."); //전달할 데이터
			//뷰에 전달할 값
		}
		return mav;
	}
	
	/*
	 * // 회원가입 get
	 * 
	 * @RequestMapping(value = "/join_check", method = RequestMethod.GET) public
	 * void getjoin_check() throws Exception { logger.info("get join_check"); }
	 */
		
	@RequestMapping("join.do") //세부 url
	public String join() {
		return "member/join"; //join.jsp로 이동
	}
	
	// 회원가입 post
	@RequestMapping("join_check.do")
	public String join_check(MemberDTO dto) throws Exception {
		logger.info("join_check : " + dto);
		/*
		 * String email = dto.getEmail() + "@" + dto.getTextemail();
		 * dto.setEmail(email);
		 */
		/*
		 * String postcode = dto.getPostcode(); String address = dto.getAddress();
		 * String detailAddress = dto.getDetailAddress(); String extraAddress =
		 * dto.getExtraAddress(); dto.setPostcode(postcode); dto.setAddress(address);
		 * dto.setDetailAddress(detailAddress); dto.setExtraAddress(extraAddress);
		 */
		memberService.join_check(dto);
		
		return "member/login";
	}
		
	@RequestMapping("idCheck.do")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String userid) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		String id = "";
		System.out.println(userid);
		id = memberService.idcheck(userid);
		System.out.println(id);
		if (id == null) {
			map.put("rst", 0);
		} else {
			map.put("rst", 1);
		}
		return map;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		//세션 초기화
		memberService.logout(session);
		//login.jsp로 이동
		mav.setViewName("redirect:/main/home.do");
		mav.addObject("message", "logout");
		return mav;
	}
	
	@RequestMapping("memberUpdateView.do")
	public String memberUpdateView() throws Exception{
		
		return "member/memberUpdateView";
	}

	@RequestMapping("memberUpdate.do")
	public String updateMember(MemberDTO dto, HttpSession session) throws Exception{
		memberService.updateMember(dto);
		session.invalidate();
		return "redirect:/main/home.do";
	}
	
	@RequestMapping("generateEmailVerifyNumber.do")
	@ResponseBody
	public Map<String, Object> generateEmailVerifyNumber(MemberDTO dto) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (dto.getEmail() != null && dto.getTextemail() != null) {
			String email = dto.getEmail() + "@" + dto.getTextemail();
			logger.info("인증을 위한 이메일 주소 : " + email);
			String verifyOrder = memberService.generateEmailVerifyNumber(email);
			map.put("result", verifyOrder);
		} else {
			map.put("result", null);
		}
		return map;
	}
	
	@RequestMapping("emailVerifyCheck.do")
	@ResponseBody
	public Map<String, Object> emailVerifyCheck(String verifyOrder, String verifyNumber) throws Exception {
		logger.info("인증번호 : " + verifyOrder + ", " + verifyNumber);
		int order_num = Integer.parseInt(verifyOrder);
		int ver_num = Integer.parseInt(verifyNumber);
		Map<String, Object> map = new HashMap<String, Object>();
		int result = memberService.emailVerify(order_num, ver_num);
		map.put("result", result);
		return map;
	}
	
}
