package com.poly.petfoster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.PetService;

@RestController
@RequestMapping("/api/")
public class PetController {

    @Autowired
    PetService petService;

    @GetMapping("home")
    public ResponseEntity<ApiResponse> home() {
        return ResponseEntity.ok(petService.selectRecentPet());
    }

    @GetMapping("pet-detail")
    public ResponseEntity<ApiResponse> pet_detail(@RequestParam("petID") String petID) {
        return ResponseEntity.ok(petService.findById(petID));
    }
}
