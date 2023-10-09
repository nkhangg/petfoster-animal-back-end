package com.poly.petfoster.request.product;

import javax.validation.constraints.NotBlank;

public class GetProductRequest {
     @NotBlank(message = "Product ID can't be blank!")
    private String id;
}
