package com.packageHut.api.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserRegisterRequest {
    private String user_id;
    private String first_name;
    private String last_name;
    private String email;
    private String phone;
    private String password;
    private double longitude;
    private double latitude;
}
