package com.poly.petfoster.service;

import com.poly.petfoster.request.OrderRequest;
import com.poly.petfoster.response.ApiResponse;

public interface OrderService {
    public ApiResponse createOrder(String jwt, OrderRequest orderRequest);
}
