package com.poly.petfoster.service;

import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetails;

import com.poly.petfoster.entity.User;
import com.poly.petfoster.request.ResetPasswordRequest;
import com.poly.petfoster.request.UpdateUserRequest;
import com.poly.petfoster.response.ApiResponse;

public interface UserService {

    public User findById(String userId);

    public UserDetails findByUsername(String username);

    public ApiResponse findByEmail(String email);

    public User findUserProfileByJwt(String jwt);

    public ApiResponse updatePassword(ResetPasswordRequest resetPasswordRequest);

    public ApiResponse getAllUser(String jwt, Optional<Integer> pages);

    public ApiResponse updateUser(UpdateUserRequest updateUserRequest);

    public ApiResponse deleteUser(UpdateUserRequest updateUserRequest);

}
