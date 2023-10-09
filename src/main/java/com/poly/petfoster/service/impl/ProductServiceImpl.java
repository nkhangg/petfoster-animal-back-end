package com.poly.petfoster.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.request.product.GetProductRequest;

import com.poly.petfoster.response.ProductResponse;
import com.poly.petfoster.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductService productService;
    
    @Override
    public ProductResponse getProduct( GetProductRequest getProductReq){
        
   
        return ProductResponse.builder()
        .id(null)
        .name(null)
        .desc(null)
        .productType(null)
        .isActive(null)
        // .productsRepo(null)
        // .orderDetails(null)
        .imgs(null)
        .build();
    };
    @Override
    public ProductResponse createProduct( ProductRequest ProductReq){
        
   
        return ProductResponse.builder()
        .id(null)
        .name(null)
        .desc(null)
        .productType(null)
        .isActive(null)
        .productsRepo(null)
        .orderDetails(null)
        .imgs(null)
        .build();
    };
    @Override
    public ProductResponse updateProduct( ProductRequest ProductReq){
  
        return ProductResponse.builder()
        .id(null)
        .name(null)
        .desc(null)
        .productType(null)
        .isActive(null)
        .productsRepo(null)
        .orderDetails(null)
        .imgs(null)
        .build();
    };
     @Override
    public ProductResponse deleteProduct( ProductRequest ProductReq){
        
        
        return ProductResponse.builder()
        .id(null)
        .name(null)
        .desc(null)
        .productType(null)
        .isActive(null)
        .productsRepo(null)
        .orderDetails(null)
        .imgs(null)
        .build();
    };
}
