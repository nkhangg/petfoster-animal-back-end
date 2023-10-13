package com.poly.petfoster.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.poly.petfoster.request.ProfileRepuest;
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
  public ApiResponse updateProfile(ProfileRepuest profileRepuest, String token) {
      Map<String, String> errorsMap = new HashMap<>();
      String username = jwtProvider.getUsernameFromToken(token);

      User user = userRepository.findByUsername(username).orElse(null);


      if(user == null){
        return  ApiResponse.builder()
                  .message("User not found !")
                  .status(HttpStatus.NOT_FOUND.value())
                  .errors(true)
                  .data(null)
                  .build();
      }

      if(!user.getEmail().equals(profileRepuest.getEmail())){
          errorsMap.put("email", "Can't update email !");
      }


      try {
          Date birthday = new SimpleDateFormat("D/MM/yyyy").parse(profileRepuest.getBirthday());
          user.setBirthday(birthday);
      } catch (ParseException e) {
          errorsMap.put("birthday", "Birthday invalid !");
      }  
      

      
      // check errors
      if(!errorsMap.isEmpty()){
          return ApiResponse.builder()
                          .message("Update faild !")
                          .errors(errorsMap)
                          .data(null)
                          .build();
      }

      user.setFullname(profileRepuest.getFullname());
      user.setGender(profileRepuest.getGender());
      user.setAddress(profileRepuest.getAddress());
      user.setPhone(profileRepuest.getPhone());

      return ApiResponse.builder()
                        .message("Update success!")
                        .errors(false)
                        .data(userRepository.save(user))
                        .build();
    }

}
