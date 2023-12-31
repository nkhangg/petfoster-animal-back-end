package com.poly.petfoster.service;

import com.poly.petfoster.request.repository.CreateRepoRequest;
import com.poly.petfoster.request.repository.UpdateRepoRequest;
import com.poly.petfoster.response.ApiResponse;

public interface ProductRepoService {

    ApiResponse updateOrCreateRepo(Integer id, UpdateRepoRequest updateRepoRequest);

    ApiResponse deleteProductRepo(Integer id);

    ApiResponse getProductRepositories(String idProduct);

    ApiResponse addAProductRepository(String idProduct, CreateRepoRequest createRepoRequest);

}
