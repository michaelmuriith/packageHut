package com.packageHut.api.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserResponse {
    private String user_id;
    private String first_name;
    private String last_name;
    private String email;
    private String phone;
    private UserResponse.Address address;
    private String token;

    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Address {
        private double longitude;
        private double latitude;
    }
}
