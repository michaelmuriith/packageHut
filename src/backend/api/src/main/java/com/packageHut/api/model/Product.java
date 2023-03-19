package com.packageHut.api.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "t_product")
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "product_id")
    private String productId;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "shop_id")
    private Shop shop;
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
