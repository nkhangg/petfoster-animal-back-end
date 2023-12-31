package com.poly.petfoster.repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import com.poly.petfoster.entity.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer> {
    
    @Query("select sum(o.total) from Orders o where CONVERT(DATE, o.createAt) = :date")
    public Double getRevenueByDate(@Param("date") Date date);

    @Query("select sum(o.total) from Orders o where MONTH(o.createAt) = :month")
    public Double getRevenueByMonth(@Param("month") Integer month);

    //--------------------
    @Query(nativeQuery = true, 
            value ="select sum(total) from orders where convert(date, create_at) = convert(date, getdate())")
    public Integer getDailyRevenue();

    @Query(nativeQuery = true, 
            value ="select sum(total) from orders where convert(date, create_at) = convert(date, getdate() - 1)")
    public Integer getYesterdayRevenue();

    @Query(nativeQuery = true, 
            value ="select count(*) from orders where convert(date, create_at) = convert(date, getdate())")
    public Integer getDailyOrder();

    @Query(nativeQuery = true, 
            value ="select count(*) from orders where convert(date, create_at) = convert(date, getdate() - 1)")
    public Integer getYesterdayOrder();

    @Procedure(name = "GetRevenueByYear")
    List<Integer> getRevenueByYear(@Param("year") Integer year);

    @Query(nativeQuery = true, 
            value ="select sum(total) from orders where year(create_at) = :year")
    public Integer getTotalRevenueByYear(@Param("year") Integer year);

    @Procedure(name = "GetProductTypeRevenueByYear")
    List<Integer> getProductTypeRevenueByYear(@Param("year") Integer year);

    @Query(nativeQuery = true, value = "select p.product_id as id, product_name as name, brand, size, sum(quantity) as quantity, sum(od.total) as revenue\r\n" + //
                    "from product p\r\n" + //
                    "inner join order_detail od on od.product_id = p.product_id " + 
                    "inner join orders o on o.id = od.order_id " + 
                    "where convert(date, o.create_at) between :minDate and :maxDate " +
                    "group by p.product_id, product_name, brand, size")
    List<Map<String, Object>> getProductRevenueByDate(@Param("minDate") Date minDate, @Param("maxDate") Date maxDate);

    
    @Query(nativeQuery = true, 
            value ="select sum(total) from orders where convert(date, create_at) between :minDate and :maxDate")
    public Integer getTotalRevenueByDate(@Param("minDate") Date minDate, @Param("maxDate") Date maxDate);    

    @Query(nativeQuery = true, value = "select convert(date, min(create_at)) from orders")
    public Date getMinDate();

    @Query(nativeQuery = true, value = "select convert(date, max(create_at)) from orders")
    public Date getMaxDate();

    @Query(nativeQuery = true, value ="select * from orders o " +
                        "inner join shipping_info si on si.id = o.shipping_info_id " +
                        "where [user_id] = :userId")
    public List<Orders> orderHistory(@Param("userId") String userId);

}
