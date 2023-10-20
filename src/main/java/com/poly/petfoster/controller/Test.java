package com.poly.petfoster.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.poly.petfoster.config.JwtProvider;
import com.poly.petfoster.repository.UserRepository;
import com.poly.petfoster.request.LoginRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.AuthResponse;

@RestController
public class Test {

    @Autowired
    JwtProvider jwtProvider;

    @Autowired
    UserRepository userRepository;

    @PostMapping("/test")
    public ResponseEntity<AuthResponse> login(@RequestBody LoginRequest loginRequest) {

        String jwt = jwtProvider.generateToken(
                new UsernamePasswordAuthenticationToken(userRepository.findByUsername("hantl"), null, null));
        // AuthResponse authResponse = authService.login(loginRequest);
        return ResponseEntity.ok(AuthResponse.builder().token(jwt).message("success").build());
    }

    @PostMapping("/api/test")
    public ResponseEntity<AuthResponse> login(@RequestPart("image") List<MultipartFile> file,
            @RequestPart("data") LoginRequest loginRequest) {
        System.out.println(file.get(0).getOriginalFilename());
        System.out.println(loginRequest);

        return ResponseEntity.ok(AuthResponse.builder().token("Khang").message("success").build());
    }

}
