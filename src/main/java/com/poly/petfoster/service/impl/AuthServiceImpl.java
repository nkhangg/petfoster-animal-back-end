package com.poly.petfoster.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.poly.petfoster.config.JwtProvider;
import com.poly.petfoster.request.LoginRequest;
import com.poly.petfoster.request.RegisterRequest;
import com.poly.petfoster.response.AuthResponse;
import com.poly.petfoster.service.AuthService;
import com.poly.petfoster.service.UserService;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    UserService userService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    JwtProvider jwtProvider;

    @Override
    public AuthResponse login(LoginRequest loginReq) {

        String username = loginReq.getUsername();
        String password = loginReq.getPassword();

        Authentication authentication = authenticate(username, password);

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String token = jwtProvider.generateToken(authentication);

        return AuthResponse.builder()
            .message("Login success")
            .jwt(token)
            .build();
    }

    @Override
    public AuthResponse register(RegisterRequest registerReq) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'register'");
    }

    @Override
    public Authentication authenticate(String username, String password) {
        
        UserDetails userDetails = userService.findByUsername(username);

        if(userDetails == null) {
            throw new BadCredentialsException("Invalid username");
        }
        
        // if(!passwordEncoder.matches(password, userDetails.getPassword())) {
        //     throw new BadCredentialsException("Invalid password");
        // }

        return new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
    }
    
}
