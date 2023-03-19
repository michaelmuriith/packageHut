package com.packageHut.api.service;

import com.packageHut.api.common.JwtTokenUtil;
import com.packageHut.api.dto.request.UserLoginRequest;
import com.packageHut.api.dto.request.UserRegisterRequest;
import com.packageHut.api.dto.response.UserResponse;
import com.packageHut.api.model.User;
import com.packageHut.api.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final JwtTokenUtil jwtTokenUtil;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    private UserResponse buildUserResponse(User user, String token) {
        return UserResponse.builder()
                .user_id(user.getUserId())
                .first_name(user.getFirstName())
                .last_name(user.getLastName())
                .email(user.getEmail())
                .phone(user.getPhone())
                .address(UserResponse.Address.builder()
                        .longitude(user.getLongitude())
                        .latitude(user.getLatitude())
                        .build())
                .token(token)
                .build();
    }

    private User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public UserResponse registerUser(UserRegisterRequest userRegisterRequest) {
        User existingUser = findUserByEmail(userRegisterRequest.getEmail());
        if (existingUser != null) throw new RuntimeException("User with email " + userRegisterRequest.getEmail() + " already exists.");

        String encodedPassword = passwordEncoder.encode(userRegisterRequest.getPassword());

        User user = User.builder()
                .userId(UUID.randomUUID().toString())
                .firstName(userRegisterRequest.getFirst_name())
                .lastName(userRegisterRequest.getLast_name())
                .email(userRegisterRequest.getEmail())
                .phone(userRegisterRequest.getPhone())
                .latitude(userRegisterRequest.getLatitude())
                .longitude(userRegisterRequest.getLongitude())
                .password(encodedPassword)
                .build();

        userRepository.save(user);
        String token = jwtTokenUtil.generateToken(user);
        return buildUserResponse(user, token);
    }

    public UserResponse loginUser(UserLoginRequest userLoginRequest) {
        User existingUser = findUserByEmail(userLoginRequest.getEmail());
        if (existingUser == null) throw new RuntimeException("User with email " + userLoginRequest.getEmail() + " does not exist.");
        if (!passwordEncoder.matches(userLoginRequest.getPassword(), existingUser.getPassword())) throw new RuntimeException("Password is incorrect.");
        String token = jwtTokenUtil.generateToken(existingUser);
        userRepository.save(existingUser);
        return buildUserResponse(existingUser, token);
    }

    public boolean checkIfUserIsTheShopOwner(String token, String shopId) {
        final String jwt = token.substring(7);
        User user = userRepository.findByUserId(jwtTokenUtil.getUserIdFromToken(jwt));
        return user.getShop().getShopId().equals(shopId);
    }

    public User getUser(String token) {
        final String jwt = token.substring(7);
        return userRepository.findByUserId(jwtTokenUtil.getUserIdFromToken(jwt));
    }

    public User getUserByToken(String token) {
        return userRepository.findByUserId(jwtTokenUtil.getUserIdFromToken(token.substring(7)));
    }

    public User getUserById(String userId) {
        return userRepository.findByUserId(userId);
    }
}
