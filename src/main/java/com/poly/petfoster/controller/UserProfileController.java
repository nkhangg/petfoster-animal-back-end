package com.poly.petfoster.controller;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.request.RegisterRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.AuthResponse;
import com.poly.petfoster.response.ProfileResponse;
import com.poly.petfoster.service.ProfileService;

@RestController
@RequestMapping("/api/user")
public class UserProfileController {

    @Autowired
    ProfileService profileService;

    @GetMapping("/profile")
    public ResponseEntity<ApiResponse> getProfile(@RequestHeader("Authorization") String jwt){
        return ResponseEntity.ok(profileService.getProfile(jwt));
    }

    @PostMapping("/update")
    public ResponseEntity<ApiResponse> register(@Valid @RequestBody ProfileResponse profileResponse) {
        return ResponseEntity.ok(profileService.updateProfile(profileResponse));
    }


    

}
