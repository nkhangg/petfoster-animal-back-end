package com.poly.petfoster.request.product;

import java.util.List;

import javax.validation.constraints.NotBlank;

import com.poly.petfoster.entity.Imgs;
import com.poly.petfoster.entity.OrderDetail;
import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.entity.ProductType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductRequest {
    @NotBlank(message = "Product ID can't be blank!")
    private String id;  
    private String name;
    private String desc;
    private ProductType productType;
    private Boolean isActive;
    private List<ProductRepo> productsRepo ;
    private List<OrderDetail> orderDetails;
    private List<Imgs> imgs;
}
