package com.poly.petfoster.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.Product;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.ProductResponse;
import com.poly.petfoster.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Override
    public ApiResponse getAllProduct(){
        
        return ApiResponse.builder()
            .message("Query product Successfully")
            .status(null)
            .errors(null)
            .data(
                productRepository.findAll()
                )
            .build(); 
    }     
    @Override
    public ApiResponse getProduct( String id){

        Product selectProduct = productRepository.findById(id).orElse(null);

        // List<Product> list =  new ArrayList<>();
        // productRepository.save(null);
        //  list.add(productRepository.findAll());
        
          ProductResponse data =ProductResponse.builder()
                .id(selectProduct.getId())
                .name(selectProduct.getName())
                .desc(selectProduct.getDesc())
                .productType(selectProduct.getProductType())
                .isActive(selectProduct.getIsActive())
                .productsRepo(selectProduct.getProductsRepo())
                .imgs(selectProduct.getImgs())
                .build();
        
            
        return ApiResponse.builder()
            .message("Query product Successfully")
            .status(HttpStatus.OK.value())
            .errors(null)
            .data(
                data
                )
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
    public ProductResponse updateProduct(String id, ProductRequest ProductReq){
        






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
