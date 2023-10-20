package com.poly.petfoster.service;


import com.poly.petfoster.request.UpdateRepoRequest;
import com.poly.petfoster.request.product.ProductRepoRequest;
import com.poly.petfoster.response.ApiResponse;

public interface ProductRepoService {
    
    ApiResponse updateRepo(Integer id, UpdateRepoRequest updateRepoRequest);
   ApiResponse deleteProductRepo(Integer id);

}
