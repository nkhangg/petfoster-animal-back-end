package com.poly.petfoster.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartItemResponse {
    String id;
    String brand;
    Integer size;
    String image;
    String name;
    Integer price;
    Integer repo;
}
