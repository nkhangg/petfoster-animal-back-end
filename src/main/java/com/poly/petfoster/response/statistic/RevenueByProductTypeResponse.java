package com.poly.petfoster.response.statistic;

import java.util.List;

import com.poly.petfoster.dto.Revenue;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RevenueByProductTypeResponse {
    
    private List<Revenue> revenueByProductType;

}

// {
//     'RevenueByProductType': [
//         {
//             "cat food": 150000
//         }
//     ]
// }