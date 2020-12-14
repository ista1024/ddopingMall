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
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("adminHome.do")
	public String adminHome() {
		return "admin/adminHome";
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
	
	//------------------------ 상품 관련 ------------------------//
	
	@RequestMapping("product_write.do")
	public String product_write() {
		return "admin/product_write";
	}
	
	@RequestMapping("product_insert.do")
	public String product_insert(@ModelAttribute ProductDTO dto) {
		logger.info("product_insert.do before dto : " + dto);
		String filename1="-";
		String filename2="-";
		if(!dto.getFile1().isEmpty()) {
			filename1=dto.getFile1().getOriginalFilename();
			try {
				String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\spring03\\resources\\images\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename1));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(!dto.getFile2().isEmpty()) {
			filename2=dto.getFile2().getOriginalFilename();
			try {
				String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\spring03\\resources\\images\\";
				new File(path).mkdir();
				dto.getFile2().transferTo(new File(path+filename2));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setProduct_photo(filename1);
		dto.setProduct_main_photo(filename2);
		logger.info("product_insert.do after dto : " + dto);
		productService.insertProduct(dto);
		return "redirect:/main/home.do";
	} // product_insert()
	
	@RequestMapping("product_edit/{product_num}")
	public ModelAndView product_edit(@PathVariable("product_num") int product_num, ModelAndView mav) {
		// 이동할 뷰의 이름
		mav.setViewName("admin/product_edit");
		// 뷰에 전달할 데이터
		mav.addObject("dto", productService.detailProduct(product_num));
		return mav;
	}
	
	//------------------------ 수정해야 함 ------------------------//
	
	@RequestMapping("product_update.do")
	public String update(ProductDTO dto) {
		String filename1 = " ";
		String filename2 = " ";
		// 새로운 첨부파일이 있으면
		if(!dto.getFile1().isEmpty()) {
			// 첨부파일의 이름
			filename1 = dto.getFile1().getOriginalFilename();
			try {
				String path = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\spring03\\resources\\images\\";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부 파일 이동 
				dto.getFile1().transferTo(new File(path + filename1));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setProduct_photo(filename1);
		} else { // 새로운 첨부파일이 없을 때
			// 기존에 첨부한 파일 정보를 가져옴
			ProductDTO dto2 = productService.detailProduct(dto.getProduct_num());
			dto.setProduct_main_photo(dto2.getProduct_main_photo());
		}
		if(!dto.getFile2().isEmpty()) {
			// 첨부파일의 이름
			filename2 = dto.getFile2().getOriginalFilename();
			try {
				String path = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\spring03\\resources\\images\\";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부 파일 이동 
				dto.getFile2().transferTo(new File(path + filename2));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setProduct_main_photo(filename2);
		} else { // 새로운 첨부파일이 없을 때
			// 기존에 첨부한 파일 정보를 가져옴
			ProductDTO dto2 = productService.detailProduct(dto.getProduct_num());
			dto.setProduct_main_photo(dto2.getProduct_main_photo());
		}
		dto.setProduct_photo(filename1);
		dto.setProduct_main_photo(filename2);
		productService.updateProduct(dto);
		return "redirect:/main/home.do";
	}
	
	@RequestMapping("product_delete.do")
	public String delete(@RequestParam int product_num) {
		// 첨부파일 삭제
		String filename = productService.fileInfo(product_num);
		logger.info("첨부파일 이름" + filename);
		if (filename != null && !filename.equals("-")) {
			String path = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\spring03\\resources\\images\\";
			File f = new File(path + filename);
			logger.info("파일존재여부 : " + f.exists());
			if (f.exists()) { // 첨부파일이 존재하면
				f.delete(); // 파일 삭제
				logger.info("첨부파일 " + filename + "이 삭제되었습니다.");
			}
		}
		// 레코드 삭제
		productService.deleteProduct(product_num);
		// 화면 이동
		return "redirect:/main/home.do";
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
