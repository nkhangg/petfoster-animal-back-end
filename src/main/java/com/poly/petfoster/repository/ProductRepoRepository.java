package com.poly.petfoster.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.petfoster.entity.ProductRepo;

public interface ProductRepoRepository  extends JpaRepository<ProductRepo, Integer>{
    
}
