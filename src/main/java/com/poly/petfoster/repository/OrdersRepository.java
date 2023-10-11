package com.poly.petfoster.repository;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.petfoster.entity.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer> {
    
    @Query("select sum(o.total) from Orders o where CONVERT(DATE, o.createAt) = :date")
    public Double getRevenueByDate(@Param("date") Date date);

    @Query("select sum(o.total) from Orders o where MONTH(o.createAt) = :month")
    public Double getRevenueByMonth(@Param("month") Integer month);

    @Query("select sum(o.total) from Orders o where YEAR(o.createAt) = :year")
    public Double getRevenueByYear(@Param("year") Integer year);

}
