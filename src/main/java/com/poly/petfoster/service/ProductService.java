package com.poly.petfoster.service;

import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.ProductResponse;

public interface ProductService {
    ApiResponse getProduct( String id);
    ApiResponse getAllProduct();
    ProductResponse createProduct( ProductRequest createProductReq);
    ProductResponse updateProduct( String id, ProductRequest updateProductReq);
    ProductResponse deleteProduct( ProductRequest deleteProductReq);
}
