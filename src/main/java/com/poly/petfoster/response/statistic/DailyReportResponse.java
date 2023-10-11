package com.poly.petfoster.response.statistic;

import com.poly.petfoster.dto.DailyReport;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DailyReportResponse {
    private DailyReport dailyReport;
}
