package com.example.spring03.service.shop;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring03.model.shop.dao.ProductDAO;
import com.example.spring03.model.shop.dto.ProductDTO;
import com.example.spring03.model.shop.dto.ProductImageDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO productDao;

	@Override
	public List<ProductDTO> listProduct() {
		// TODO Auto-generated method stub
		return productDao.listProduct();
	}

	@Override
	public ProductDTO detailProduct(int product_num) {
		// TODO Auto-generated method stub
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
	public String fileInfo(int product_num) {
		// TODO Auto-generated method stub
		return productDao.fileInfo(product_num);
	}

	@Override
	public List<ProductDTO> listProductop(int product_num) {
		
		return productDao.listProductop(product_num);
	}
	@Override
	public List<ProductImageDTO> listProductImage(int product_num) {
		return productDao.listProductImage(product_num);
	}
	@Override
	public List<ProductDTO> listop2(int product_num) {
		return productDao.listop2(product_num);
	}



}
