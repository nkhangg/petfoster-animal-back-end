package com.poly.petfoster.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.poly.petfoster.request.product.ProductInfoRequest;
import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.ProductService;

@RestController
@RequestMapping("/api/admin/product/")
public class ProductController {
    @Autowired
    ProductService productService;

    @GetMapping("")
    public ResponseEntity<ApiResponse> getAllProduct(@RequestParam("page") Optional<Integer> page) {
        return ResponseEntity.ok(productService.getAllProduct(page));
    }

    @GetMapping("{id}")
    public ResponseEntity<ApiResponse> getProduct(@PathVariable("id") String id) {
        return ResponseEntity.ok(productService.getProduct(id));
    }

    @GetMapping("info/{id}")
    public ResponseEntity<ApiResponse> getProductInfo(@PathVariable("id") String id) {
        return ResponseEntity.ok(productService.getProductInfo(id));
    }

    @PostMapping("info/{id}")
    public ResponseEntity<ApiResponse> updateProductWithInfo(@PathVariable("id") String id,
            @RequestBody ProductInfoRequest productInfoRequest) {
        return ResponseEntity.ok(productService.updateProductWithInfo(id, productInfoRequest));
    }

    @PostMapping(value = "")
    public ResponseEntity<ApiResponse> createProduct(@RequestBody ProductRequest productRequest) {
        return ResponseEntity.ok(productService.createProduct(productRequest));
    }

    @PostMapping(value = "{id}")
    public ResponseEntity<ApiResponse> updateProduct(@PathVariable("id") String id,
            @RequestBody ProductRequest productRequest) {
        System.out.println(productRequest);
        return ResponseEntity.ok(productService.updateProduct(id, productRequest));

    }

    @DeleteMapping("{id}")
    public ResponseEntity<ApiResponse> DeleteProduct(@PathVariable("id") String id) {
        return ResponseEntity.ok(productService.deleteProduct(id));
    }
}
