package com.poly.petfoster.controller;

import javax.servlet.annotation.MultipartConfig;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.poly.petfoster.request.ProfileRepuest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.ProfileService;

@RestController
@RequestMapping("/api/user")
public class UserProfileController {

    @Autowired
    ProfileService profileService;

    @GetMapping("/profile")
    public ResponseEntity<ApiResponse> getProfile(@RequestHeader("Authorization") String jwt) {
        return ResponseEntity.ok(profileService.getProfile(jwt));
    }

    @PostMapping("/update")
    public ResponseEntity<ApiResponse> updateProfile(@Valid @RequestPart("user") ProfileRepuest profileRepuest,
            @RequestHeader("Authorization") String jwt, MultipartFile avatar) {
        return ResponseEntity.ok(profileService.updateProfile(profileRepuest, avatar, jwt));
    }

    @PostMapping("/changePass")
    public ResponseEntity<ApiResponse> changePass(@Valid @RequestHeader("Authorization") String jwt, String password, String newPassword, String confirmPassword) {
        return ResponseEntity.ok(profileService.changePassUser(jwt, password, newPassword, confirmPassword));
    }

}
