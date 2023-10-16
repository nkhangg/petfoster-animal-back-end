package com.poly.petfoster.request;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

import com.poly.petfoster.constant.RespMessage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChangePasswordRequest {
    @NotBlank(message = RespMessage.NOT_EMPTY)
    @Length(min = 6, message = "must be longer than 6 characters!")
    String password;

    @NotBlank(message = RespMessage.NOT_EMPTY)
    @Length(min = 6, message = "must be longer than 6 characters!")
    String newPassword;

    

    @NotBlank(message = RespMessage.NOT_EMPTY)
    @Length(min = 6, message = "must be longer than 6 characters!")
    String confirmPassword;
}
