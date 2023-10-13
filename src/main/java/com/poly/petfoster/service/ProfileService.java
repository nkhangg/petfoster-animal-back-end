package com.poly.petfoster.service;


import org.springframework.web.multipart.MultipartFile;

import com.poly.petfoster.request.ProfileRepuest;
import com.poly.petfoster.response.ApiResponse;

public interface ProfileService {

    ApiResponse getProfile(String jwt);

    ApiResponse updateProfile(ProfileRepuest profileRepuest, MultipartFile avartar, String token);

}
