package com.poly.petfoster.service;

import org.springframework.security.core.Authentication;

import com.poly.petfoster.request.LoginRequest;
import com.poly.petfoster.request.RegisterRequest;
import com.poly.petfoster.response.AuthResponse;

public interface AuthService {
    
    AuthResponse login(LoginRequest loginReq);
    AuthResponse register(RegisterRequest registerReq);
    Authentication authenticate(String username, String password);

}
