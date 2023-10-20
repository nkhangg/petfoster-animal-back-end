package com.poly.petfoster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.request.UpdateRepoRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.ProductRepoService;

@RestController
@RequestMapping("/api/admin/product-repo/")
public class ProductRepoController {
    
    @Autowired
    ProductRepoService productRepoService;

    @PostMapping("{id}")
    public ResponseEntity<ApiResponse> updateProductRepo(@PathVariable("id") Integer id,
            @RequestBody UpdateRepoRequest updateRepoRequest) {
        return ResponseEntity.ok(productRepoService.updateRepo(id, updateRepoRequest));

    }

}
