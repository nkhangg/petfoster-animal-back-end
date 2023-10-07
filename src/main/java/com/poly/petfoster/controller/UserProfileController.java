package com.poly.petfoster.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.repository.UserProfileRepository;
import com.poly.petfoster.response.UserProfile;

@RestController
@RequestMapping("/api/profile")
public class UserProfileController {
    @Autowired
    private UserProfileRepository userProfileRepository;

    @GetMapping
    public ResponseEntity<UserProfile> getProfile(Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            Optional<UserProfile> userProfileOptional = userProfileRepository.findByUsername(username);
            if (userProfileOptional.isPresent()) {
                UserProfile userProfile = userProfileOptional.get();
                return ResponseEntity.ok(userProfile);
            } else {
                return ResponseEntity.notFound().build();
            }
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }
}
