package com.poly.petfoster.service;

import java.time.LocalDate;
import java.util.Date;

import com.poly.petfoster.response.statistic.DailyReportResponse;
import com.poly.petfoster.response.statistic.ImpactsResponse;
import com.poly.petfoster.response.statistic.RevenueByTimeResponse;
import com.poly.petfoster.response.statistic.RevenueByProductTypeResponse;

public interface StatisticService {
    
    public ImpactsResponse getImpactOfYear();

    public RevenueByProductTypeResponse getRevenueByProductType();

    public DailyReportResponse getDailyReport();

    public RevenueByTimeResponse getRevenueByDate(Date date);

    public RevenueByTimeResponse getRevenueByMonth(Integer month);

    public RevenueByTimeResponse getRevenueByYear(Integer year);

}
