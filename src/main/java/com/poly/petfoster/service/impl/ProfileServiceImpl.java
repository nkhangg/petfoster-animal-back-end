package com.poly.petfoster.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestHeader;

import com.poly.petfoster.config.JwtProvider;
import com.poly.petfoster.constant.JwtConstant;
import com.poly.petfoster.constant.PatternExpression;
import com.poly.petfoster.constant.RespMessage;
import com.poly.petfoster.entity.User;
import com.poly.petfoster.repository.UserRepository;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.AuthResponse;
import com.poly.petfoster.response.ProfileResponse;
import com.poly.petfoster.service.ProfileService;

@Service
public class ProfileServiceImpl implements ProfileService {

  @Autowired
  JwtProvider jwtProvider;

  @Autowired
  UserRepository userRepository;

  @Override
  public ApiResponse getProfile(String jwt) {

    String username = jwtProvider.getUsernameFromToken(jwt);

    User user = userRepository.findByUsername(username).orElse(null);

    return ApiResponse.builder().message("Successfully!").status(200).errors(false).data(user).build();

  }

  @Override
  public ApiResponse updateProfile(ProfileResponse profileResponse) {
    Map<String, String> errorsMap = new HashMap<>();

    if (PatternExpression.NOT_SPECIAL.matcher(profileResponse.getUsername()).find()) {
      errorsMap.put("username", "username must not contains special characters!");
      return ApiResponse.builder()
          .message(HttpStatus.BAD_REQUEST.toString())
          .errors(errorsMap)
          .build();
    }

    if (userRepository.existsByUsername(profileResponse.getUsername())) {
      errorsMap.put("username", RespMessage.EXISTS);
      return ApiResponse.builder()
          .message(HttpStatus.CONFLICT.toString())
          .errors(errorsMap)
          .build();
    }

    if (userRepository.existsByEmail(profileResponse.getEmail())) {
      errorsMap.put("email", RespMessage.EXISTS);
      return ApiResponse.builder()
          .message(HttpStatus.CONFLICT.toString())
          .errors(errorsMap)
          .build();
    }

    User profileUser = User.builder()
                      .username(profileResponse.getUsername())
                      .email(profileResponse.getEmail())
                      .gender(profileResponse.getGender())
                      .phone(profileResponse.getPhone())
                      .fullname(profileResponse.getFullname())
                      .birthday(profileResponse.getBirthday())
                      .build();
  
      userRepository.save(profileUser);

      return ApiResponse.builder()
                        .message("Update success!")
                        .errors(false)
                        .build();
  }

}
