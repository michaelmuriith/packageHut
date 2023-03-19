package com.packageHut.api.model;



import jakarta.persistence.*;
import lombok.*;

import java.util.List;


@Entity
@Table(name = "t_shop")
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Shop {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "shop_id")
    private String shopId;

    @Column(name = "shop_name")
    private String shopName;

    @Column(name = "shop_logo")
    private String shopLogo;

    private String shop_address;

    private String shop_phone;

    private String shop_email;

    @OneToMany(mappedBy = "shop", cascade = CascadeType.ALL)
    private List<Product> products;

}
