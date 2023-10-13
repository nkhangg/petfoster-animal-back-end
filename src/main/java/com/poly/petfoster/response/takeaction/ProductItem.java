package com.poly.petfoster.response.takeaction;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductItem {

    private String id;
    private String brand;
    private Object size;
    private Integer discount;
    private String image;
    private String name;
    private Integer oldPrice;
    private Integer price;
    private Integer rating;
   
}
