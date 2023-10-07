package com.poly.petfoster.controller.statistic;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.response.ApiResponse;

@RestController
public class StatisticController {
    
    @GetMapping("/api/admin/tk")
    public ResponseEntity<ApiResponse> tk(){
        return ResponseEntity.ok(ApiResponse.builder().message("ok123456").build());
    }

}
