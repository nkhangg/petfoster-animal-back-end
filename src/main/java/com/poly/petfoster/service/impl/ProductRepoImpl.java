package com.poly.petfoster.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.repository.ProductRepoRepository;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.ProductRepoService;

@Service
public class ProductRepoImpl implements ProductRepoService {

    @Autowired
    ProductRepoRepository productRepoRepository;

    @Override
    public ApiResponse deleteProductRepo(Integer id) {
        ProductRepo productRepo = productRepoRepository.findById(id).orElse(null);
        if (productRepo == null) {
            return ApiResponse.builder()
                    .message("Product repo not found !")
                    .status(HttpStatus.NOT_FOUND.value())
                    .errors(true)
                    .data(null)
                    .build();
        }
        productRepoRepository.delete(productRepo);
        return ApiResponse.builder()
                .message("Delete success!")
                .errors(false)
                .status(HttpStatus.OK.value())
                .build();
    }
}
