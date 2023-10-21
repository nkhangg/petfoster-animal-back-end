package com.poly.petfoster.request.cart;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CartItemRequest {
    String id;
    Integer size;
}
