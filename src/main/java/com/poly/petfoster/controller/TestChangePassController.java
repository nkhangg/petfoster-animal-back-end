package com.poly.petfoster.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.poly.petfoster.request.ProfileRepuest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.UserService;

@RestController
@RequestMapping("/api/user")
public class TestChangePassController {
    
    @Autowired
    UserService userService;

    @PostMapping("/changePass")
    public ResponseEntity<ApiResponse> changePass(String username, String password, String newPassword, String confirmPassword) {
        return ResponseEntity.ok(userService.changePassUser(username, password, newPassword, confirmPassword));
    }
}
