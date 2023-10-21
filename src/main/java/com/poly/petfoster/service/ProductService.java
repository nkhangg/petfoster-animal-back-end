package com.poly.petfoster.service;

import java.util.List;
import java.util.Optional;

import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.poly.petfoster.request.CreateProductRequest;
import com.poly.petfoster.request.product.ProductInfoRequest;
import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;

public interface ProductService {
    ApiResponse getProduct(String id);

    ApiResponse getAllProduct(Optional<Integer> page);

    ApiResponse getProductInfo(String id);

    ApiResponse updateProductWithInfo(String id, ProductInfoRequest productInfoRequest);

    // ApiResponse getProductByType();
    // ApiResponse getProductBySize();
    // ApiResponse getProductByInterval();
    // ApiResponse getProductByFilter();
    ApiResponse createProduct(ProductRequest createProductReq);

    ApiResponse updateProduct(String id, ProductRequest updateProductReq);

    ApiResponse deleteProduct(String id);

    ApiResponse createProduct2(CreateProductRequest createProductRequest, List<MultipartFile> images);

}
