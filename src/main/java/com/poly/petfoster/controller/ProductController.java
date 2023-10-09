package com.poly.petfoster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.request.product.GetProductRequest;
import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ProductResponse;
import com.poly.petfoster.service.ProductService;

@RestController
@RequestMapping("/api/product/")
public class ProductController {
    @Autowired
    ProductService productService;
    
    @GetMapping("{id}")
    public ResponseEntity<ProductResponse> getProduct(@RequestBody GetProductRequest productRequest,@PathVariable("id") String id) {
        return ResponseEntity.ok(productService.getProduct(productRequest));
    }
    @PostMapping("create")
    public ResponseEntity<ProductResponse> createProduct(@RequestBody ProductRequest productRequest) {
        return ResponseEntity.ok(productService.createProduct(productRequest));
    }
}
