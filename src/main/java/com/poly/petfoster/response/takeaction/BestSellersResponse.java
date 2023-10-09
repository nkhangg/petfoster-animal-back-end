package com.poly.petfoster.response.takeaction;

import java.util.List;

import com.poly.petfoster.entity.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BestSellersResponse {
    private List<ProductTakeAction> data;
    private Integer pages;
}
