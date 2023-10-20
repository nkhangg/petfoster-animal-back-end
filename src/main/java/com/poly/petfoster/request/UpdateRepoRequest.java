package com.poly.petfoster.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UpdateRepoRequest {
    
    private Double inPrice;
    private Double outPrice;
    private Integer quantity;

}
