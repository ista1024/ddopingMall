package com.example.spring03.service.admin;

import java.util.List;

import org.json.simple.JSONObject;

import com.example.spring03.model.member.dto.MemberDTO;
import com.example.spring03.model.shop.dto.ProductDTO;

public interface AdminService {
	List<ProductDTO> listProduct(); // 상품 리스트
	ProductDTO detailProduct(int product_num); // 상품 정보
	void updateProduct(ProductDTO dto); // 상품 수정
    void deleteProduct(int product_num); // 상품 삭제
    void insertProduct(ProductDTO dto); // 상품 등록
    public List<MemberDTO> listAllMember() throws Exception; // 회원 리스트 호출 
    public void updateMember(MemberDTO dto) throws Exception;//회원정보 수정
    public JSONObject getChartData(); // 구글차트
    
}
