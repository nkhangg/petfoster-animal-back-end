package com.poly.petfoster.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import java.util.Optional;

import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.ProductResponse;

public interface ProductService {
    ApiResponse getProduct(String id);

    ApiResponse getAllProduct(Optional<Integer> page);

    // ApiResponse getProductByType();
    // ApiResponse getProductBySize();
    // ApiResponse getProductByInterval();
    // ApiResponse getProductByFilter();
    ApiResponse createProduct( ProductRequest createProductReq, List<MultipartFile> listImgs);
    ApiResponse updateProduct( String id, ProductRequest updateProductReq, List<MultipartFile> listImgs);

    ApiResponse deleteProduct(String id);
}
