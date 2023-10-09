package com.poly.petfoster.service;

import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.request.product.GetProductRequest;

import com.poly.petfoster.response.ProductResponse;

public interface ProductService {
    ProductResponse getProduct( GetProductRequest getProductReq);
    ProductResponse createProduct( ProductRequest createProductReq);
    ProductResponse updateProduct( ProductRequest updateProductReq);
    ProductResponse deleteProduct( ProductRequest deleteProductReq);
}
