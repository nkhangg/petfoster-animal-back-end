package com.poly.petfoster.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.Product;
import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.repository.ProductRepoRepository;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.request.UpdateRepoRequest;
import com.poly.petfoster.request.product.ProductRepoRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.ProductRepoService;

@Service
public class RepoProductServiceImpl implements ProductRepoService {

    @Autowired
    ProductRepoRepository productRepoRepository;

    @Autowired
    ProductRepository productRepository;

    @Override
    public ApiResponse updateRepo(Integer id, UpdateRepoRequest updateRepoRequest) {
        
        ProductRepo productRepo = productRepoRepository.findById(id).orElse(null);

        if(productRepo == null) {
            return ApiResponse.builder().message("Repo id is not exsist").status(404).errors("REPO_NOT_FOUND").build();
        }

        productRepo.setInPrice(updateRepoRequest.getInPrice());
        productRepo.setOutPrice(updateRepoRequest.getOutPrice());
        productRepo.setQuantity(updateRepoRequest.getQuantity());

        productRepoRepository.save(productRepo);

        return ApiResponse.builder().message("Successfully").status(200).errors(false).build();
    }
    
}
