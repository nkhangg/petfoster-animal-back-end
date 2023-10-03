package com.poly.petfoster.request;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginRequest {

    @NotBlank(message = "Username can't be blank!")
    private String username;

    @NotBlank(message = "Password can't be blank!")
    @Length(min = 6, message = "Password is invalid!")
    private String password;

}
