package com.example.spring03.controller.main;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring03.controller.member.MemberController;
import com.example.spring03.model.shop.dto.ProductDTO;
import com.example.spring03.service.shop.ProductService;

@Controller
@RequestMapping("main/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	ProductService productService;
	
	@RequestMapping("home.do")
	public ModelAndView home(ModelAndView mav){
		List<ProductDTO> list=productService.listProduct();
		mav.setViewName("home");
		mav.addObject("list", list);
		System.out.println(list);
		return mav;
	}
	
	@RequestMapping("menubar.do")
	public ModelAndView menubar(ModelAndView mav, ProductDTO dto) {
		logger.info("서브페이지 요청, product_type : " + dto);
		List<ProductDTO> list=productService.listProduct(dto);
		mav.setViewName("menubar");
		mav.addObject("list", list);
		System.out.println(list);
		return mav;
	}
	
}
