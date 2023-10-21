package com.poly.petfoster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.request.cart.UpdateCartRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.CartService;

@RestController
@RequestMapping("/api/user")
public class CartController {
    @Autowired
    CartService cartService;

    @GetMapping("/cart")
    public ResponseEntity<ApiResponse> getCart(@RequestBody UpdateCartRequest updateCartRequest) {
        return ResponseEntity.ok(cartService.getListCart(updateCartRequest));
    }
}
