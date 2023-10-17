package com.poly.petfoster.controller.admin;

import java.util.Optional;

import javax.swing.text.html.Option;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.entity.User;
import com.poly.petfoster.repository.UserRepository;
import com.poly.petfoster.request.ProfileRepuest;
import com.poly.petfoster.request.UpdateUserRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.UserService;

@RestController
@RequestMapping("/api/admin")
public class CRUDUserController {
    @Autowired
    UserService userService;

    @GetMapping("/users")
    public ResponseEntity<ApiResponse> getProfile(@RequestHeader("Authorization") String jwt,
            @RequestParam("page") Optional<Integer> pages) {

        return ResponseEntity.ok(userService.getAllUser(jwt, pages));
    }

    @PostMapping("/users/update")
    public ResponseEntity<ApiResponse> updateUser(@RequestBody UpdateUserRequest updateUserRequest) {
        return ResponseEntity.ok(userService.updateUser(updateUserRequest));
    }

    @PostMapping("/users/delete")
    public ResponseEntity<ApiResponse> deleteUser(@RequestBody UpdateUserRequest updateUserRequest) {
        return ResponseEntity.ok(userService.deleteUser(updateUserRequest));
    }
}
