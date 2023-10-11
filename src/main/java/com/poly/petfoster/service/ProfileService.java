package com.poly.petfoster.service;

import org.springframework.web.bind.annotation.RequestHeader;

import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.ProfileResponse;

public interface ProfileService {

    ApiResponse getProfile(String jwt);

    ApiResponse updateProfile(ProfileResponse profileResponse);

}
