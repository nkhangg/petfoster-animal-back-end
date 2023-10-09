package com.poly.petfoster.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.petfoster.entity.Product;


public interface ProductRepository extends JpaRepository<Product, String>{

    @Query(nativeQuery = true, value = "select top 4 * from product p where p.is_active = 1 order by create_at desc")
    public List<Product> selectNewArrivals();

    // @Query(nativeQuery = true, value = "select * from product p join product_type t on t.product_type_id = p.[type_id] where p.product_id in ( select top 100 order_detail.product_id from order_detail group by order_detail.product_id order by sum(order_detail.quantity) desc)")
    @Query(nativeQuery = true, value = "select * from product p join product_type t on t.product_type_id = p.[type_id] "
    +"where p.product_id in ( select top 100 product_id from order_detail group by product_id ) ")
    List<Product> findAllProducts();
}
