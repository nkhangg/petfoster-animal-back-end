package com.poly.petfoster.response.admin.user;

import java.util.List;

import com.poly.petfoster.entity.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AllUserResponse {
    List<User> users;
    Integer pages;
}
