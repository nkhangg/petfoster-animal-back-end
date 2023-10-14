package com.poly.petfoster.service.impl;

import java.io.File;
import java.nio.file.Files;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.multipart.MultipartFile;

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
import com.poly.petfoster.ultils.ImageUtils;
import com.poly.petfoster.ultils.PortUltil;

import antlr.StringUtils;

@Service
public class ProfileServiceImpl implements ProfileService {

  @Autowired
  JwtProvider jwtProvider;

  @Autowired
  UserRepository userRepository;

  @Autowired
  PortUltil portUltil;

  @Override
  public ApiResponse getProfile(String jwt) {

    String username = jwtProvider.getUsernameFromToken(jwt);

    User user = userRepository.findByUsername(username).orElse(null);

    user.setAvatar(portUltil.getUrlImage(user.getAvatar()));

    return ApiResponse.builder().message("Successfully!").status(200).errors(false).data(user).build();

  }

     @Autowired
    ServletContext app; 

  @Override
  public ApiResponse updateProfile(@Valid ProfileRepuest profileRepuest, String token) {
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

      
      if(profileRepuest.getFullname().isEmpty()){
        errorsMap.put("fullname", "Fullname can't be blank");
      }

      if(profileRepuest.getAddress().isEmpty()){
        errorsMap.put("address", "Address can't be blank");
      }

      if(profileRepuest.getEmail().isEmpty()){
        errorsMap.put("email", "Email can't be blank");
      }

      if(profileRepuest.getPhone().isEmpty()){
        errorsMap.put("phone", "Phone can't be blank");
      }

      if(profileRepuest.getBirthday().isEmpty()){
        errorsMap.put("birthday", "Birthday  can't be blank");
      }else{
            try {
            Date birthday = new SimpleDateFormat("D/MM/yyyy").parse(profileRepuest.getBirthday());

            System.out.println(birthday);
            user.setBirthday(birthday);
            } catch (ParseException e) {
                errorsMap.put("birthday", "Birthday invalid !");
            }  
      }

      if(profileRepuest.getAvartar() != null){
            if(profileRepuest.getAvartar().getSize() > 500000){
                errorsMap.put("avartar", "Image size is too large");
            }else{
            try {
                    File file = ImageUtils.createFileImage();
                    
                    profileRepuest.getAvartar().transferTo(new File(file.getAbsolutePath()));
                    user.setAvatar(file.getName());
            } catch (Exception e) {
                    System.out.println("Erorr in update avatar in Profile service impl");
                    e.printStackTrace();
                    return ApiResponse.builder()
                            .message(RespMessage.INTERNAL_SERVER_ERROR.getValue())
                            .errors(true)
                            .status(500)
                            .data(null)
                            .build();
            }
        }
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

      User newUser  = userRepository.save(user);

      newUser.setAvatar(portUltil.getUrlImage(user.getAvatar()));


      return ApiResponse.builder()
                        .message("Update success!")
                        .errors(false)
                        .status(HttpStatus.OK.value())
                        .data(newUser)
                        .build();
    }

}
