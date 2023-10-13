package com.poly.petfoster.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.request.OrderRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.OrderService;

@RestController
@RequestMapping("/api/user/")
public class OrderController {
    
    @Autowired
    OrderService orderService;

    @PostMapping("order")
    public ResponseEntity<ApiResponse> createOrder(@RequestHeader("Authorization") String jwt, @Valid @RequestBody OrderRequest orderRequest) {
        return ResponseEntity.ok(orderService.createOrder(jwt, orderRequest));
    }
}
