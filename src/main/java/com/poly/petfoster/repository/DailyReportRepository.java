package com.poly.petfoster.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;

import com.poly.petfoster.dto.DailyReport;

public interface DailyReportRepository extends JpaRepository<DailyReport, Long> {
    
    @Procedure(name = "GetDailyReport")
    public DailyReport getDailyReport();

}
