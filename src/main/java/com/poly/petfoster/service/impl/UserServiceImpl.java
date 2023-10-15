package com.poly.petfoster.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.User;
import com.poly.petfoster.random.RandomPassword;
import com.poly.petfoster.repository.UserRepository;
import com.poly.petfoster.request.ResetPasswordRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.UserService;
import com.poly.petfoster.ultils.MailUtils;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    RandomPassword randomPassword;

    @Autowired
    MailUtils mailUtils;

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
    public ApiResponse updatePassword(ResetPasswordRequest resetPasswordRequest) {

        User existsUser = userRepository.findByEmail(resetPasswordRequest.getEmail()).orElse(null);
        if (existsUser == null) {
            return ApiResponse.builder().data(null).message("User is not exist").status(404)
                    .errors(false).build();
        }
        String newPassword = randomPassword.randomPassword();
        System.out.println(newPassword);
        existsUser.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(existsUser);

        // Send password to mail
        mailUtils.sendEmail(resetPasswordRequest.getEmail(), "New password", "New your password is " + newPassword);
        return ApiResponse.builder().data(existsUser).message("Successfully!").status(200)
                .errors(false).build();
    }

    @Override
    public User findUserProfileByJwt(String jwt) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findUserProfileByJwt'");
    }

    @Override
    public ApiResponse findByEmail(String email) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByEmail'");
    }

}
