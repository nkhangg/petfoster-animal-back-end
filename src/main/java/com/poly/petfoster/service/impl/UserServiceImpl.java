package com.poly.petfoster.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.poly.petfoster.config.JwtProvider;
import com.poly.petfoster.constant.RespMessage;
import com.poly.petfoster.entity.User;
import com.poly.petfoster.random.RandomPassword;
import com.poly.petfoster.repository.UserRepository;
import com.poly.petfoster.request.ResetPasswordRequest;
import com.poly.petfoster.request.UpdateUserRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.common.PagiantionResponse;
import com.poly.petfoster.response.order_history.OrderHistory;
import com.poly.petfoster.service.UserService;
import com.poly.petfoster.ultils.ImageUtils;
import com.poly.petfoster.ultils.MailUtils;
import com.poly.petfoster.ultils.PortUltil;

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

    @Autowired
    JwtProvider jwtProvider;

    @Autowired
    PortUltil portUltil;

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

    @Override
    public ApiResponse getAllUser(String jwt, Optional<Integer> pages) {

        Pageable pageable = PageRequest.of(pages.orElse(0), 10);

        Page<User> data = userRepository.findAll(pageable);

        data.getContent().stream().forEach(item -> {
            item.setAvatar(portUltil.getUrlImage(item.getAvatar()));
        });

        return ApiResponse.builder().message("Successfully!")
                .status(200)
                .errors(false)
                .data(PagiantionResponse.builder().data(data.getContent()).pages(data.getTotalPages()).build())
                .build();
    }

    @Override
    public ApiResponse updateUser(@Valid UpdateUserRequest updateUserRequest) {
        Map<String, String> errorsMap = new HashMap<>();
        
        User user = userRepository.findById(updateUserRequest.getId()).orElse(null);

        if (user == null) {
            return ApiResponse.builder()
                    .message("User not found !")
                    .status(HttpStatus.NOT_FOUND.value())
                    .errors(true)
                    .data(null)
                    .build();
        }

        // start validate

        if (!user.getEmail().equals(updateUserRequest.getEmail())) {
            errorsMap.put("email", "Can't update email !");
        }

        if (updateUserRequest.getFullname().isEmpty()) {
            errorsMap.put("fullname", "Fullname can't be blank");
        }

        if (updateUserRequest.getAddress().isEmpty()) {
            errorsMap.put("address", "Address can't be blank");
        }

        if (updateUserRequest.getEmail().isEmpty()) {
            errorsMap.put("email", "Email can't be blank");
        }

        if (updateUserRequest.getPhone().isEmpty()) {
            errorsMap.put("phone", "Phone can't be blank");
        }

        if (updateUserRequest.getBirthday().orElse(null) == null) {
            errorsMap.put("birthday", "Birthday can't be blank");
        } else {
            user.setBirthday(updateUserRequest.getBirthday().orElse(null));
        }

        if (updateUserRequest.getAvatar() != null) {
            if (updateUserRequest.getAvatar().getSize() > 500000) {
                errorsMap.put("avartar", "Image size is too large");
            } else {
                try {
                    File file = ImageUtils.createFileImage();

                    updateUserRequest.getAvatar().transferTo(new File(file.getAbsolutePath()));
                    user.setAvatar(file.getName());
                } catch (Exception e) {
                    System.out.println("Erorr in update avatar in Profile service impl");
                    e.printStackTrace();
                    return ApiResponse.builder()
                            .message(RespMessage.INTERNAL_SERVER_ERROR.getValue())
                            .errors(true)
                            .status(500)
                            .data(null)
                            .build();
                }
            }
        }

        //check errors

        if (!errorsMap.isEmpty()) {
            return ApiResponse.builder()
                    .message("Update fail !")
                    .errors(errorsMap)
                    .data(null)
                    .build();
        }

        // end validate
        
        user.setFullname(updateUserRequest.getFullname());
        user.setGender(updateUserRequest.getGender());
        user.setRole(updateUserRequest.getRole());
        // user.setBirthday(updateUserRequest.getBirthday().orElse(null));
        user.setPhone(updateUserRequest.getPhone());
        user.setAddress(updateUserRequest.getAddress());
        user.setEmail(updateUserRequest.getEmail());

        User newUser = userRepository.save(user);

        newUser.setAvatar(portUltil.getUrlImage(user.getAvatar()));

        return ApiResponse.builder()
                .message("Update success!")
                .errors(false)
                .status(HttpStatus.OK.value())
                .data(newUser)
                .build();

    }

}
