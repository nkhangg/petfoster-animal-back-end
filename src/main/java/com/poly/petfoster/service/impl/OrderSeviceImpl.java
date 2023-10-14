package com.poly.petfoster.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.poly.petfoster.config.JwtProvider;
import com.poly.petfoster.constant.PatternExpression;
import com.poly.petfoster.entity.OrderDetail;
import com.poly.petfoster.entity.Orders;
import com.poly.petfoster.entity.Product;
import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.entity.ShippingInfo;
import com.poly.petfoster.entity.User;
import com.poly.petfoster.repository.OrderDetailRepository;
import com.poly.petfoster.repository.OrdersRepository;
import com.poly.petfoster.repository.ProductRepoRepository;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.repository.ShippingInfoRepository;
import com.poly.petfoster.repository.UserRepository;
import com.poly.petfoster.request.OrderProduct;
import com.poly.petfoster.request.OrderRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.AuthResponse;
import com.poly.petfoster.service.OrderService;

@Service
public class OrderSeviceImpl implements OrderService{

    @Autowired
    JwtProvider jwtProvider;

    @Autowired
    UserRepository userRepository;

    @Autowired
    ShippingInfoRepository shippingInfoRepository;

    @Autowired
    OrdersRepository ordersRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductRepoRepository productRepoRepository;

    @Override
    public ApiResponse createOrder(String jwt, OrderRequest orderRequest) {
        
        Map<String, String> errorsMap = new HashMap<>();
        User user = userRepository.findByUsername(jwtProvider.getUsernameFromToken(jwt)).orElse(null);

        if(user == null) {
            errorsMap.put("user", "user not found");
            return ApiResponse.builder()
                              .message("Unauthenrized")
                              .status(HttpStatus.UNAUTHORIZED.value())
                              .errors(errorsMap).build();
        }

        if(PatternExpression.NOT_SPECIAL_SPACE.matcher(orderRequest.getFullname()).find()) {
            errorsMap.put("fullname", "full name must not contains special characters!");
            return ApiResponse.builder()
                .message(HttpStatus.BAD_REQUEST.toString())
                .errors(errorsMap)
                .build();
        }

        if(orderRequest.getShippingFee() < 0) {
            errorsMap.put("shippingFee", "Shipping fee must larger than 0");
            return ApiResponse.builder()
                .message(HttpStatus.BAD_REQUEST.toString())
                .errors(errorsMap)
                .build();
        }

        if(!PatternExpression.IS_PHONE_VALID.matcher(orderRequest.getPhone()).matches()) {
            errorsMap.put("phone", "phone number must start with 0 and has 10 digits!");
            return ApiResponse.builder()
                .message(HttpStatus.BAD_REQUEST.toString())
                .errors(errorsMap)
                .build();
        }


        ShippingInfo shippingInfo = shippingInfoRepository.save(this.createShippingInfo(user, orderRequest));
        
        Orders order = Orders.builder()
            .shippingInfo(shippingInfo)
            .build();
        ordersRepository.save(order);

        
        List<OrderDetail> orderDetails = new ArrayList<>();
        Double total = 0.0;
        for (OrderProduct orderProduct : orderRequest.getOrderProducts()) {

            if(orderProduct.getQuantity() < 0) {
                errorsMap.put("quantity", "quantity must larger than 0");
                return ApiResponse.builder()
                    .message(HttpStatus.BAD_REQUEST.toString())
                    .errors(errorsMap)
                    .build();
            }
            
            OrderDetail orderDetail = this.createOrderDetail(order, orderProduct);
            orderDetails.add(orderDetail);

            total += orderDetail.getTotal();
        }

        order.setTotal(total);
        order.setOrderDetails(orderDetails);
        ordersRepository.save(order);

        return ApiResponse.builder()
                        .message("order successfuly!!!")
                        .status(200)
                        .errors(false)
                        .data(orderDetails).build();
    }

    public ShippingInfo createShippingInfo(User user, OrderRequest orderRequest) {

        return ShippingInfo.builder()
                    .user(user)
                    .fullName(orderRequest.getFullname())
                    .address(orderRequest.getAddress())
                    .phone(orderRequest.getPhone())
                    .shipFee(orderRequest.getShippingFee()).build();

    }
    
    public OrderDetail createOrderDetail(Orders order, OrderProduct orderProduct) {

        Product product = productRepository.findById(orderProduct.getProductId()).orElse(null);
        ProductRepo productRepo = productRepoRepository.findProductRepoByIdAndSize(orderProduct.getProductId(), orderProduct.getSize());

        OrderDetail orderDetail = orderDetailRepository.save(
            OrderDetail.builder()
                    .order(order)
                    .product(product)
                    .size(orderProduct.getSize())
                    .quantity(orderProduct.getQuantity())
                    .total(orderProduct.getQuantity() * productRepo.getOutPrice())
                    .build()
            );

        return orderDetail;
    }

}
