package com.poly.petfoster.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.request.LoginRequest;
import com.poly.petfoster.request.RegisterRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.AuthResponse;
import com.poly.petfoster.service.AuthService;

@RestController
@RequestMapping("/api/")
public class AuthController {

    @Autowired
    HttpServletRequest httpServletRequest;

    @Autowired
    AuthService authService;

    @PostMapping("login")
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody LoginRequest loginRequest) {
        return ResponseEntity.ok(authService.login(loginRequest));
    }

    @PostMapping("register")
    public ResponseEntity<AuthResponse> register(HttpServletRequest httpServletRequest,
            @Valid @RequestBody RegisterRequest registerRequest) {
        return ResponseEntity.ok(authService.register(httpServletRequest, registerRequest));
    }

    @GetMapping("/verify")
    public ResponseEntity<ApiResponse> verifyEmail(@RequestParam("code") String code) {
        return ResponseEntity.ok(authService.verifyEmail(code));
    }

    @GetMapping("/refresh-code")
    public ResponseEntity<ApiResponse> refreshCode(HttpServletRequest httpServletRequest, @RequestParam("code") String oldCode) {
        return ResponseEntity.ok(authService.refreshCode(httpServletRequest, oldCode));
    }

}
