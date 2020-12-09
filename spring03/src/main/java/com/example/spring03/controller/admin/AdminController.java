package com.example.spring03.controller.admin;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring03.controller.member.MemberController;
import com.example.spring03.model.member.dto.MemberDTO;
import com.example.spring03.model.shop.dto.ProductDTO;
import com.example.spring03.service.admin.AdminService;
import com.example.spring03.service.admin.GoogleChartService;
import com.example.spring03.service.shop.ProductService;

@Controller
@RequestMapping("admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	AdminService adminService;
	@Inject
	ProductService productService;
	@Inject
	GoogleChartService googleChartService;
	
	@RequestMapping("home.do")
	public ModelAndView adminHome(ModelAndView mav) throws Exception {
		List<ProductDTO> list = adminService.listProduct();
		mav.setViewName("admin/adminHome");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("listAllMember.do")
	public ModelAndView listAll(ModelAndView mav) throws Exception {
		logger.info("listAllMember 호출됨");
		List<MemberDTO> memberList = adminService.listAllMember();
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/memberList");
		return mav;
	}

	@RequestMapping("updateMember.do")
	@ResponseBody
	public void updateMember(MemberDTO dto) throws Exception {
		logger.info("관리자 회원 수정 호출 : " + dto);
		adminService.updateMember(dto);
	}
	
	//------------------------ 수정해야 함 ------------------------//
	//------------------------ 상품 관련 ------------------------//
	
	@RequestMapping("product_write.do")
	public String product_write() {
		return "shop/shop_write";
	}
	
	@RequestMapping("priduct_insert.do")
	public String insert(@ModelAttribute ProductDTO dto) {
		String filename = "-"; // DB에 not null로 규정됨
		// 첨부파일이 있을 때
		if(!dto.getFile1().isEmpty()) {
			// 첨부파일의 이름
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\spring02\\WEB-INF\\views\\images\\";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부 파일 이동 
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // if
		dto.setProduct_main_photo(filename);
		productService.insertProduct(dto);
		return "redirect:/shop/product/list.do";
	} // insert()
	
	@RequestMapping("edit/{product_id}")
	public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
		// 이동할 뷰의 이름
		mav.setViewName("shop/product_edit");
		// 뷰에 전달할 데이터
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(ProductDTO dto) {
		String filename = " ";
		// 새로운 첨부파일이 있으면
		if(!dto.getFile1().isEmpty()) {
			// 첨부파일의 이름
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\spring02\\WEB-INF\\views\\images\\";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부 파일 이동 
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setProduct_main_photo(filename);
		} else { // 새로운 첨부파일이 없을 때
			// 기존에 첨부한 파일 정보를 가져옴
			ProductDTO dto2 = productService.detailProduct(dto.getProduct_num());
			dto.setProduct_main_photo(dto2.getProduct_main_photo());
		}
		dto.setProduct_main_photo(filename);
		productService.updateProduct(dto);
		return "redirect:/shop/product/list.do";
	}
	
	//------------------------ 구글차트 관련 ------------------------//
	
	@RequestMapping("chart1.do")
	public ModelAndView chart1() {
		return new ModelAndView("admin/chart01");
	}
	
	@RequestMapping("chart2.do")
	public ModelAndView chart2() {
		return new ModelAndView("admin/chart02");
	}
	
	@RequestMapping("cart_money_list.do")
	public JSONObject car_money_list() {
		return googleChartService.getChartData();
	}
	
}
