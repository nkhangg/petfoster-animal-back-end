package com.poly.petfoster.response.statistic;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RevenueByTimeResponse {
    
    private Double revenueByDate;

    private Double revenueByMonth;

    private Double revenueByYear;

}
