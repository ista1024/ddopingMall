package com.example.spring03.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring03.model.shop.dto.ProductDTO;
import com.example.spring03.model.shop.dto.ProductImageDTO;
@Repository

public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<ProductDTO> listProduct() {
		
		return sqlSession.selectList("shop.list_product");
	}

	@Override
	public ProductDTO detailProduct(int product_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.shop_detail", product_num);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		sqlSession.update("shop.shop_update", dto);

	}

	@Override
	public void deleteProduct(int product_num) {
		sqlSession.delete("shop.shop_delete", product_num);

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		sqlSession.insert("shop.insert", dto);

	}

	@Override
	public String fileInfo(int product_num) {
		
		return sqlSession.selectOne("shop.fileInfo", product_num);
	}

	@Override
	public List<ProductDTO> listProductop(int product_num) {
		
		return sqlSession.selectList("shop.op_productop", product_num);
	}
	@Override
	public List<ProductImageDTO> listProductImage(int product_num) {
		return sqlSession.selectList("shop.list_productimage", product_num);
	}
	@Override
	public List<ProductDTO> listop2(int product_num) {
		
		return sqlSession.selectList("shop.op2_list", product_num);
	}

}
