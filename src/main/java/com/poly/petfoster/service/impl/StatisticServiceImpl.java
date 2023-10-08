package com.poly.petfoster.service.impl;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poly.petfoster.dto.Revenue;
import com.poly.petfoster.repository.AdoptRepository;
import com.poly.petfoster.repository.DailyReportRepository;
import com.poly.petfoster.repository.DonateRepository;
import com.poly.petfoster.repository.OrdersRepository;
import com.poly.petfoster.repository.PetRepositoty;
import com.poly.petfoster.repository.RevenueRepository;
import com.poly.petfoster.response.statistic.DailyReportResponse;
import com.poly.petfoster.response.statistic.ImpactItemResponse;
import com.poly.petfoster.response.statistic.ImpactsResponse;
import com.poly.petfoster.response.statistic.RevenueByTimeResponse;
import com.poly.petfoster.response.statistic.RevenueByProductTypeResponse;
import com.poly.petfoster.service.StatisticService;

@Service
public class StatisticServiceImpl implements StatisticService {

    @Autowired
    PetRepositoty petRepository;

    @Autowired
    DonateRepository donateRepository;
    
    @Autowired
    AdoptRepository adoptRepository;

    @Autowired
    RevenueRepository revenueRepository;

    @Autowired
    DailyReportRepository dailyReportRepository;

    @Autowired
    OrdersRepository ordersRepository;

    @Override
    public ImpactsResponse getImpactOfYear() {
        
        List<ImpactItemResponse> impactOfYear = Arrays.asList(
            new ImpactItemResponse("dog.svg", petRepository.findAll().size(), "total pets fostered"),
            new ImpactItemResponse("cats.svg", donateRepository.getDonation(), "in products & donations"),
            new ImpactItemResponse("home-dog.svg", adoptRepository.getAdoptedPets().size(), "total pets fostered")
        );
        
        return ImpactsResponse.builder().impactOfYear(impactOfYear).build();
    }

    @Override
    @Transactional(readOnly = true)
    public RevenueByProductTypeResponse getRevenueByProductType() {
        
        List<Revenue> revenues = revenueRepository.getRevenueByProductType();

        return RevenueByProductTypeResponse.builder().revenueByProductType(revenues).build();

    }

    @Override
    @Transactional(readOnly = true)
    public DailyReportResponse getDailyReport() {
       return DailyReportResponse.builder().dailyReport(dailyReportRepository.getDailyReport()).build();
    }

    @Override
    public RevenueByTimeResponse getRevenueByDate(Date date) {
        return RevenueByTimeResponse.builder().revenueByDate(ordersRepository.getRevenueByDate(date)).build();
    }
    
    @Override
    public RevenueByTimeResponse getRevenueByMonth(Integer month) {
        return RevenueByTimeResponse.builder().revenueByMonth(ordersRepository.getRevenueByMonth(month)).build();
    }

    @Override
    public RevenueByTimeResponse getRevenueByYear(Integer year) {
        return RevenueByTimeResponse.builder().revenueByYear(ordersRepository.getRevenueByYear(year)).build();
    }

}
