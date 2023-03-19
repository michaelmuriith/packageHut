package com.packageHut.api.common;

import com.packageHut.api.model.User;
import com.packageHut.api.repository.UserRepository;
import com.packageHut.api.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class TokenUtil {

    private final JwtTokenUtil jwtTokenUtil;



    public void validateToken(String token) {

        if (token == null || !token.startsWith("Bearer ")) {
            throw new RuntimeException("Invalid token");
        }

        final String jwt = token.substring(7);
        if (!jwtTokenUtil.validateToken(token)){
            throw new RuntimeException("Invalid token");
        };
    }

    public User getUser(String token) {
        if (token == null || !token.startsWith("Bearer ")) {
            throw new RuntimeException("Invalid user  token");
        }

        final String jwt = token.substring(7);
        return jwtTokenUtil.getUserFromToken(jwt);
    }

}
