package com.packageHut.api.model;

import com.packageHut.api.service.ProductService;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;


@Entity
@Table(name = "t_user")
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, name = "user_id")
    private String userId;
    @Column(nullable = false, name = "first_name")
    private String firstName;
    @Column(nullable = false, name = "last_name")
    private String lastName;
    @Column(nullable = false, unique = true)
    private String email;
    @Column(nullable = false)
    private String phone;
    @Column(nullable = false)
    private String password;
    @Column(nullable = false)
    private double longitude;
    @Column(nullable = false)
    private double latitude;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "shopId")
    private Shop shop;

}
