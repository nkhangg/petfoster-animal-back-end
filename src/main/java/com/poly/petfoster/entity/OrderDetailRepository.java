package com.poly.petfoster.entity;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>{
    List<OrderDetail> findByProduct(Product product);


    

}
