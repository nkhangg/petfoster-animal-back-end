package com.poly.petfoster.controller.report;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.response.statistic.DailyReportResponse;
import com.poly.petfoster.response.statistic.ImpactsResponse;
import com.poly.petfoster.response.statistic.RevenueByTimeResponse;
import com.poly.petfoster.response.statistic.RevenueByProductTypeResponse;
import com.poly.petfoster.service.StatisticService;

@RestController
public class StatisticController {
    
    @Autowired
    StatisticService statisticService;

    @GetMapping("/api/impact-of-year")
    public ResponseEntity<ImpactsResponse> tk(){
        return ResponseEntity.ok(statisticService.getImpactOfYear());
    }

    //coi lai response
    @GetMapping("/api/admin/report/revenue-by-product-type")
    public ResponseEntity<RevenueByProductTypeResponse> getRevenueByProductType(){
        return ResponseEntity.ok(statisticService.getRevenueByProductType());
    }

    @GetMapping("/api/admin/report/daily")
    public ResponseEntity<DailyReportResponse> getDailyReport(){
        return ResponseEntity.ok(statisticService.getDailyReport());
    }

    @GetMapping("/api/admin/report/revenue-by-time")
    public ResponseEntity<RevenueByTimeResponse> getRevenueByTime(
        @RequestParam(value = "date", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
        @RequestParam(value = "month", required = false) Integer month,
        @RequestParam(value = "year", required = false) Integer year) 
    {

        return (date != null) ? ResponseEntity.ok(statisticService.getRevenueByDate(date)) : 
               (month != null) ? ResponseEntity.ok(statisticService.getRevenueByMonth(month)) : 
               (year != null) ? ResponseEntity.ok(statisticService.getRevenueByYear(year)) : ResponseEntity.badRequest().build();
    }

}
