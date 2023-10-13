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
import com.poly.petfoster.repository.DonateRepository;
import com.poly.petfoster.repository.OrdersRepository;
import com.poly.petfoster.repository.PetRepositoty;
import com.poly.petfoster.repository.RevenueRepository;
import com.poly.petfoster.response.statistic.ImpactItemResponse;
import com.poly.petfoster.response.statistic.ImpactsResponse;
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


}
