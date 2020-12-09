package com.example.spring03.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.example.spring03.model.member.dao.MemberDAO;
import com.example.spring03.model.member.dto.MemberDTO;
import com.example.spring03.model.shop.dao.ProductDAO;
import com.example.spring03.model.shop.dto.ProductDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	MemberDAO memberDao;
	@Inject
	ProductDAO productDao;
	
	
	@Override
	public List<ProductDTO> listProduct() {
		return productDao.listProduct();
	}

	@Override
	public ProductDTO detailProduct(int product_num) {
		return productDao.detailProduct(product_num);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		productDao.updateProduct(dto);
	}

	@Override
	public void deleteProduct(int product_num) {
		productDao.deleteProduct(product_num);
	}

	@Override
	public void insertProduct(ProductDTO dto) {
		productDao.insertProduct(dto);
	}

	@Override
	public List<MemberDTO> listAllMember() throws Exception {
		return memberDao.listAllMember();
	}

	@Override
	public void updateMember(MemberDTO dto) throws Exception {
		memberDao.updateMemberByAdmin(dto);
	}

	@Override
	public JSONObject getChartData() {
		return null;
	}

}
