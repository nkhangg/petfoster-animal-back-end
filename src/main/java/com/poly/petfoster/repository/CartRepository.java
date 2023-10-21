package com.poly.petfoster.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.petfoster.entity.Carts;
import com.poly.petfoster.entity.Product;
import com.poly.petfoster.response.CartResponse;

public interface CartRepository extends JpaRepository<Product, String>{
    @Query(nativeQuery = true, value = "select a.product_id, a.brand, c.size, b.name_img, a.product_name, c.out_price, c.quantity, c.product_repo_id "
    +" from product a "
    +" join imgs b "
    +" on a.product_id = b.product_id "
    +" join product_repo c "
    +" on a.product_id = c.product_id "
    +" where a.product_id = :id and c.size = :size")
    List<Map<String, Object>> listProduct(@Param("id") String id, @Param("size") int size);
}
