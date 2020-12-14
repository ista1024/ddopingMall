package com.example.spring03.model.shop.dao;

import java.util.List;

import com.example.spring03.model.shop.dto.ProductDTO;
import com.example.spring03.model.shop.dto.ProductImageDTO;


public interface ProductDAO {
	List<ProductDTO> listProduct();
	List<ProductDTO> listProduct(ProductDTO dto);
	ProductDTO detailProduct(int product_num);
	void insertProduct(ProductDTO dto);
    void updateProduct(ProductDTO dto);
    void deleteProduct(int product_num);
    String fileInfo(int product_num);
    List<ProductDTO> listProductop(int product_num);
    List<ProductImageDTO> listProductImage(int product_num);
    List<ProductDTO> listop2(int product_num);
    
	
}
