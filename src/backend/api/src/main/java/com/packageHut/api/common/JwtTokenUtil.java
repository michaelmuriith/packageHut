package com.packageHut.api.common;

import com.packageHut.api.model.User;
import com.packageHut.api.repository.UserRepository;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Service
@RequiredArgsConstructor
public class JwtTokenUtil {

    private final UserRepository userRepository;
    private static final String SECRET_KEY = "Htr8zq4Ot8mdw17lgqINs+qGIWKVhO+4OZDCkgap+P29dgzTAqKe2BWEAbwMMQwO";

    public String generateToken(User user) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("userId", user.getUserId());
        claims.put("firstName", user.getFirstName());
        claims.put("lastName", user.getLastName());
        claims.put("email", user.getEmail());

        return Jwts.builder()
                .setClaims(claims)
                .setSubject(user.getEmail())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 10))
                .signWith(getSigningKey())
                .compact();
    }

    public boolean validateToken(String token) {
        final String jwt = token.substring(7);
        final String userIdFromToken = getUserIdFromToken(jwt);
        User user = userRepository.findByUserId(getUserIdFromToken(jwt));
        return (userIdFromToken != null  && userIdFromToken.equals(user.getUserId()) && !isTokenExpired(jwt));
    }

    public String getUserIdFromToken(String jwt) {
        return getClaimFromToken(jwt, claims -> claims.get("userId", String.class));
    }

    public User getUserFromToken(String jwt) {
        return userRepository.findByUserId(getUserIdFromToken(jwt));
    }


    public Date getExpirationDateFromToken(String jwt) {
        return getClaimFromToken(jwt, Claims::getExpiration);
    }

    private boolean isTokenExpired(String jwt) {
        return getExpirationDateFromToken(jwt).before(new Date());
    }

    private <T> T getClaimFromToken(String jwt, Function<Claims, T> claimsResolver) {
        final Claims claims = getAllClaimsFromToken(jwt);
        return claimsResolver.apply(claims);
    }

    private Claims getAllClaimsFromToken(String jwt) {
        return Jwts.parserBuilder().setSigningKey(getSigningKey()).build().parseClaimsJws(jwt).getBody();
    }

    private Key getSigningKey() {
        return Keys.hmacShaKeyFor(SECRET_KEY.getBytes());
    }
}
