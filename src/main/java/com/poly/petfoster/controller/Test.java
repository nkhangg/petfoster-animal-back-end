package com.poly.petfoster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.config.JwtProvider;
import com.poly.petfoster.repository.UserRepository;
import com.poly.petfoster.request.LoginRequest;
import com.poly.petfoster.response.AuthResponse;

@RestController
public class Test {
    
    @Autowired
    JwtProvider jwtProvider;

    @Autowired
    UserRepository userRepository;

    @PostMapping("/test")
    public ResponseEntity<AuthResponse> login(@RequestBody LoginRequest loginRequest){
        
        String jwt = jwtProvider.generateToken(new UsernamePasswordAuthenticationToken(userRepository.findByUsername("hantl"), null, null));
        // AuthResponse authResponse = authService.login(loginRequest);
        return ResponseEntity.ok(AuthResponse.builder().jwt(jwt).message("success").build());
    }
}
