package com.example.spring03.controller.main;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring03.model.shop.dto.ProductDTO;
import com.example.spring03.service.shop.ProductService;

@Controller
@RequestMapping("main/*")
public class MainController {
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
	public ModelAndView menubar(ModelAndView mav) {
		List<ProductDTO> list=productService.listProduct();
		mav.setViewName("menubar");
		mav.addObject("list", list);
		System.out.println(list);
		return mav;
	}
	
}
