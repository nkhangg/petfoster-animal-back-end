package com.poly.petfoster.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.poly.petfoster.config.JwtProvider;
import com.poly.petfoster.constant.Constant;
import com.poly.petfoster.constant.PatternExpression;
import com.poly.petfoster.constant.RespMessage;
import com.poly.petfoster.entity.User;
import com.poly.petfoster.repository.UserRepository;
import com.poly.petfoster.request.LoginRequest;
import com.poly.petfoster.request.RegisterRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.AuthResponse;
import com.poly.petfoster.service.AuthService;
import com.poly.petfoster.service.EmailService;
import com.poly.petfoster.service.UserService;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    EmailServiceImpl emailServiceImpl;

    @Autowired
    JwtProvider jwtProvider;

    @Override
    public AuthResponse login(LoginRequest loginReq) {

        String username = loginReq.getUsername();
        String password = loginReq.getPassword();

        Map<String, String> errorsMap = new HashMap<>();
        UserDetails userDetails;

        try {
            userDetails = userService.findByUsername(loginReq.getUsername());
        } catch (Exception e) {
            errorsMap.put("username", "user not found!");
            return AuthResponse.builder()
                    .message(HttpStatus.NOT_FOUND.toString())
                    .errors(errorsMap)
                    .build();
        }

        if (!passwordEncoder.matches(loginReq.getPassword(), userDetails.getPassword())) {
            errorsMap.put("username", "username is incorrect, please try again!");
            errorsMap.put("password", "password is incorrect, please try again!!");
            return AuthResponse.builder()
                    .message(HttpStatus.BAD_REQUEST.toString())
                    .errors(errorsMap)
                    .build();
        }

        if (!userDetails.isEnabled()) {
            errorsMap.put("email", "your email has not been verified");
            return AuthResponse.builder()
                    .message(HttpStatus.BAD_REQUEST.toString())
                    .errors(errorsMap)
                    .build();
        }

        Authentication authentication = authenticate(username, password);

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String token = jwtProvider.generateToken(authentication);

        return AuthResponse.builder()
                .message("Login success")
                .token(token)
                .build();
    }

    @Override
    public AuthResponse register(HttpServletRequest req, RegisterRequest registerReq) {

        Map<String, String> errorsMap = new HashMap<>();

        if (PatternExpression.NOT_SPECIAL.matcher(registerReq.getUsername()).find()) {
            errorsMap.put("username", "username must not contains special characters!");
            return AuthResponse.builder()
                    .message(HttpStatus.BAD_REQUEST.toString())
                    .errors(errorsMap)
                    .build();
        }

        if (userRepository.existsByUsername(registerReq.getUsername())) {
            errorsMap.put("username", RespMessage.EXISTS);
            return AuthResponse.builder()
                    .message(HttpStatus.CONFLICT.toString())
                    .errors(errorsMap)
                    .build();
        }

        if (userRepository.existsByEmail(registerReq.getEmail())) {
            errorsMap.put("email", RespMessage.EXISTS);
            return AuthResponse.builder()
                    .message(HttpStatus.CONFLICT.toString())
                    .errors(errorsMap)
                    .build();
        }

        if (!registerReq.getPassword().equals(registerReq.getConfirmPassword())) {
            errorsMap.put("password confirm", "is incorrect");
            return AuthResponse.builder()
                    .message(HttpStatus.CONFLICT.toString())
                    .errors(errorsMap)
                    .build();
        }

        User newUser = User.builder()
                .username(registerReq.getUsername())
                .email(registerReq.getEmail())
                .password(passwordEncoder.encode(registerReq.getPassword()))
                .gender(registerReq.getGender())
                .fullname(registerReq.getFullname())
                .createAt(new Date())
                .isActive(true)
                .role("ROLE_USER")
                .isEmailVerified(false)
                .build();

        String token = sendToken(req, registerReq.getEmail()).toString();
        newUser.setToken(token);
        userRepository.save(newUser);

        return AuthResponse.builder()
                .message("Register success!!!")
                .errors(false)
                .build();

    }

    @Override
    public ApiResponse verifyEmail(String token) {

        User user = userRepository.findByToken(token);

        if(user == null) {
            return ApiResponse.builder()
                .message("Token is not exists")
                .status(400)
                .errors(true)
                .build();
        }

        if(user.getIsEmailVerified() == true) {
            return ApiResponse.builder()
                .message("This account has been already verified, please login!")
                .status(400)
                .errors(true)
                .build();
        }


        if(new Date().getTime() - user.getTokenCreateAt().getTime() > Constant.TOKEN_EXPIRE_LIMIT) {
            return ApiResponse.builder()
                .message("Token is expired")
                .status(400)
                .errors(true)
                .build();
        }

        user.setIsEmailVerified(true);
        userRepository.save(user);

        return ApiResponse.builder()
                .message("Your email was verified, login now")
                .status(200)
                .errors(false)
                .data(user)
                .build();

    }

    @Override
    public Authentication authenticate(String username, String password) {

        UserDetails userDetails = userService.findByUsername(username);

        return new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
    }

    public UUID sendToken(HttpServletRequest req, String email) {

        UUID token = UUID.randomUUID();
        emailServiceImpl.sendVerificationEmail(req, email, token);

        return token;
    }

}
