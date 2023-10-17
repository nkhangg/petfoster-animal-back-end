package com.poly.petfoster.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.petfoster.entity.ProductType;

public interface ProductTypeRespository extends JpaRepository<ProductType, String>{    
    
}
