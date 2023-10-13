package com.poly.petfoster.service;

import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.ProductResponse;

public interface ProductService {
    ApiResponse getProduct( String id);
    ApiResponse getAllProduct();
    ApiResponse createProduct( ProductRequest createProductReq);
    ApiResponse updateProduct( String id, ProductRequest updateProductReq);
    ApiResponse deleteProduct(String id, ProductRequest deleteProductReq);
}
