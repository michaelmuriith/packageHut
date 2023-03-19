package com.packageHut.api.dto.request;

import com.packageHut.api.model.User;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreateShopRequest {
    private String shop_id;
    private String user_id;
    private String shop_name;
    private String shop_logo;
    private String shop_address;
    private String shop_phone;
    private String shop_email;
}
