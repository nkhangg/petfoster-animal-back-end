package com.poly.petfoster.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;

import com.poly.petfoster.dto.Revenue;

public interface RevenueRepository extends JpaRepository<Revenue, Long> {
    
    @Procedure(name = "GetRevenueByProductType")
    List<Revenue> getRevenueByProductType();

}
