package com.poly.petfoster.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.User;
import com.poly.petfoster.repository.UserRepository;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Override
    public User findById(String userId) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public UserDetails findByUsername(String username) throws UsernameNotFoundException {

        User existsUser = userRepository.findByUsername(username).get();

        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(existsUser.getRole()));

        return new org.springframework.security.core.userdetails.User(existsUser.getUsername(),
                existsUser.getPassword(), authorities);
    }

    @Override
    public User findByEmail(String email) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByEmail'");
    }

    @Override
    public User findUserProfileByJwt(String jwt) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findUserProfileByJwt'");
    }

    @Override
    public ApiResponse changePassUser(String username, String password, String newPassword, String confirmPassword) {
        Map<String, String> errorsMap = new HashMap<>();
        User user = userRepository.findByUsername(username).orElse(null);

        if (user == null) {
            return ApiResponse.builder()
                    .message("User not found !")
                    .status(HttpStatus.NOT_FOUND.value())
                    .errors(true)
                    .data(null)
                    .build();
        }

        if (!user.getUsername().equals(username)) {
            errorsMap.put("username", "Invalid username!");
        }


        if (!user.getPassword().equals(password)) {
            errorsMap.put("password", "Invalid password!");
        }

        if(!newPassword.equals(confirmPassword)){
            errorsMap.put("confirmPassword", "Invalid confirm password!");
        }

        if(!errorsMap.isEmpty()){
            return ApiResponse.builder()
                            .message("Change pass fail !")
                            .errors(errorsMap)
                            .data(null)
                            .build();
        }

        user.setPassword(confirmPassword);

        return ApiResponse.builder()
                .message("Change pass success!")
                .errors(false)
                .data(userRepository.save(user))
                .build();

    }

}
