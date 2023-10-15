package com.poly.petfoster.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.petfoster.request.ResetPasswordRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.UserService;

@Controller
@RequestMapping("/api/")
public class UserController {
    @Autowired
    UserService userService;

    @PostMapping("forgot-password")
    public ResponseEntity<ApiResponse> forgotPassword(@Valid @RequestBody ResetPasswordRequest resetPasswordRequest) {
        return ResponseEntity.ok(userService.updatePassword(resetPasswordRequest));
    }
}
