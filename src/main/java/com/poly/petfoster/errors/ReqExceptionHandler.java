package com.poly.petfoster.errors;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.poly.petfoster.response.ApiResponse;

@ControllerAdvice
public class ReqExceptionHandler extends ResponseEntityExceptionHandler {

        @Override
        @Nullable
        protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex, HttpHeaders headers,
            HttpStatus status, WebRequest request) {


            List<FieldError> fieldErrors = ex.getBindingResult().getFieldErrors();

            List<String> listErrors = new ArrayList<>();

            for (FieldError fieldError : fieldErrors) {
                String errorMessage = fieldError.getDefaultMessage();
                listErrors.add(errorMessage);
            }

            ApiResponse apiResponceErrors = ApiResponse.builder()
                                            .message("User invalid")
                                            .status(status.value())
                                            .errors(listErrors)
                                            .build();

            

            return new ResponseEntity<>(apiResponceErrors,  headers, status);
        }

    
}
