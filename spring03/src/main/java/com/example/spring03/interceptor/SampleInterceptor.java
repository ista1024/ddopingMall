package com.example.spring03.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 등록은 servlet-context에 bean을 등록해야 함
// HandlerInterceptorAdapter를 상속(추상클래스)
public class SampleInterceptor extends HandlerInterceptorAdapter{
	// 로깅 처리
	private static final Logger logger = LoggerFactory.getLogger(SampleInterceptor.class);
	
	// 선처리 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("pre handle...");
		return true; // true이면 계속 진행, false면 멈춤
	}

	// 후처리 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("post handle...");
	}
	
}
