package com.packageHut.api.controller;

import com.packageHut.api.dto.request.UserLoginRequest;
import com.packageHut.api.dto.request.UserRegisterRequest;
import com.packageHut.api.dto.response.UserResponse;
import com.packageHut.api.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
@RequiredArgsConstructor
public class UserController {
    final UserService userService;

    @PostMapping("/register")
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<UserResponse> registerUser(@RequestBody UserRegisterRequest userRegisterRequest) {
        UserResponse user = userService.registerUser(userRegisterRequest);
        return ResponseEntity.ok(user);
    }

    @PostMapping("/login")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<UserResponse> loginUser(@RequestBody UserLoginRequest userLoginRequest) {
        UserResponse user = userService.loginUser(userLoginRequest);
        return ResponseEntity.ok(user);
    }


    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<String> handleRuntimeException(RuntimeException ex) {
        return ResponseEntity.badRequest().body(ex.getMessage());
    }


}
