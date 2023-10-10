package com.poly.petfoster.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.petfoster.entity.Product;

public interface ProductRepository extends JpaRepository<Product, String> {
    @Query("select p from Product p where p.id = :id")
    public Optional<Product> findById(@Param("id") String id); 
    // @Query(nativeQuery = true, value = "select* from product p inner join product_repo pr on pr.product_id= p.product_id
    // // where p.product_id ='PD0001'")
    // public Optional<Product> findById(@Param("id") String id);       

    // @Query("select p from product p where p.product_name = :name")
    // public Optional<Product> findByName(@Param("name") String name);

}
