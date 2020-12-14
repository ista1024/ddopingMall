package com.example.spring03.controller.shop;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring03.model.shop.dto.ProductDTO;
import com.example.spring03.model.shop.dto.ProductImageDTO;
import com.example.spring03.service.shop.ProductService;

@Controller
@RequestMapping("/shop/shop/*")
public class ProductController {
	@Inject
	ProductService productService;
	
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav, String product) {
		System.out.println("list.do 호출한 product type : " + product);
		List<ProductDTO> list=productService.listProduct();
		mav.setViewName("redirect:/main/home.do");
		mav.addObject("list", list);
		System.out.println(list);
		return mav;
	}
	@RequestMapping("/detail/{product_num}")
	public ModelAndView detail(@PathVariable int product_num,
			ModelAndView mav) {
		List<ProductDTO> listop=productService.listProductop(product_num);
		List<ProductImageDTO> listimage=productService.listProductImage(product_num);
		List<ProductDTO> listop2=productService.listop2(product_num);
		mav.setViewName("/shop/shop_detail");
		mav.addObject("dto", productService.detailProduct(product_num));
		mav.addObject("op_list", listop);
		mav.addObject("op2_list", listop2);
		mav.addObject("picture_list", listimage);
		return mav;
	}
	@RequestMapping("update.do")
	public String update(ProductDTO dto) {
		String filename="-";
		if(!dto.getFile1().isEmpty()) {
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
						+ "\\tmp0\\wtpwebapps\\spring03\\WEB-INF\\views\\images\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setProduct_main_photo(filename);
		}else {
			ProductDTO dto2
			=productService.detailProduct(dto.getProduct_num());
			dto.setProduct_main_photo(dto2.getProduct_main_photo());
		}
		productService.updateProduct(dto);
		return "redirect:/main/home.do";
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "shop/shop_write";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute ProductDTO dto) {
		String filename1="-";
		String filename2="-";
		if(!dto.getFile1().isEmpty()) {
			filename1=dto.getFile1().getOriginalFilename();
			try {
				String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
						+ "\\tmp0\\wtpwebapps\\spring03\\WEB-INF\\views\\images\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename1));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(!dto.getFile2().isEmpty()) {
			filename2=dto.getFile1().getOriginalFilename();
			try {
				String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
						+ "\\tmp0\\wtpwebapps\\spring03\\WEB-INF\\views\\images\\";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename2));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setProduct_photo(filename1);
		dto.setProduct_main_photo(filename2);
		productService.insertProduct(dto);
		return "redirect:/main/home.do";
	}
	
	@RequestMapping("edit/{product_num}")
	public ModelAndView edit(@PathVariable("product_num") int product_num,
			ModelAndView mav) {
		mav.setViewName("shop/shop_edit");
		mav.addObject("dto",productService.detailProduct(product_num));
		return mav;
	}
	@RequestMapping("delete.do")
	public String delete(@RequestParam int product_num) {
		String filename=productService.fileInfo(product_num);
		if (filename != null && !filename.equals("-")) {
			String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
					+ "\\tmp0\\wtpwebapps\\spring03\\WEB-INF\\views\\images\\";
			File f=new File(path+filename);
			if(f.exists()) {
				f.delete();
			}
		}
		productService.deleteProduct(product_num);
		return "redirect:/main/home.do";
	}
}
