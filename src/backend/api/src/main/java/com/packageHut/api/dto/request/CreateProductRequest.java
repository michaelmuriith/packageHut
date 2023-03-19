package com.packageHut.api.dto.request;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreateProductRequest {
    private String product_name;
    private String product_description;
    private String product_price;
    private String product_image;
    private String product_category;
    private String product_quantity;
    private String product_status;
    private String product_created_at;
    private String product_updated_at;
}
