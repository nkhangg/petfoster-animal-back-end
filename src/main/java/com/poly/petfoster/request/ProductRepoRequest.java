package com.poly.petfoster.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductRepoRequest {

    Integer size;

    Integer quantity;

    Integer inPrice;

    Integer outPrice;

}

//  size: number;
//     quantity: number;
//     inPrice: number;
//     outPrice: number;