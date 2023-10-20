package com.poly.petfoster.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.impl.ProductRepoImpl;

@RestController
@RequestMapping("/api/admin/")
public class ProductRepoController {

    @Autowired
    ProductRepoImpl productRepoImpl;

    @DeleteMapping("/product-repo/{id}")
    public ResponseEntity<ApiResponse> deleteProductRepo(@PathVariable(value = "id") Integer id) {
        System.out.println(">>>>>>> " + id);
        return ResponseEntity.ok(productRepoImpl.deleteProductRepo(id));
    }
}
