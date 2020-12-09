package com.example.spring03.service.shop;

import java.util.List;


import com.example.spring03.model.shop.dto.ProductDTO;
import com.example.spring03.model.shop.dto.ProductImageDTO;

public interface ProductService {
	List<ProductDTO> listProduct();
	ProductDTO detailProduct(int product_num);
    void updateProduct(ProductDTO dto);
    void deleteProduct(int product_num);
    void insertProduct(ProductDTO dto);
    String fileInfo(int product_num);
    List<ProductDTO> listProductop(int product_num);
    List<ProductImageDTO> listProductImage(int product_num);
    List<ProductDTO> listop2(int product_num);
	

}
