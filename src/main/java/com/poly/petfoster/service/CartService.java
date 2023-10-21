package com.poly.petfoster.service;

import com.poly.petfoster.request.cart.UpdateCartRequest;
import com.poly.petfoster.response.ApiResponse;

public interface CartService {
    ApiResponse getListCart(UpdateCartRequest updateCartRequest);
}
