package com.packageHut.api.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "t_order")
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "order_id")
    private String orderId;
    private String customer_name;
    private String customer_email;
    private String customer_phone;
    private String delivery_address;
    private String order_status;
    private String order_created_at;
    private String order_updated_at;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumns({
            @JoinColumn(name = "order_id", referencedColumnName = "order_id"),
            @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    })
    private List<OrderLineItems> orderLineItems;
 }
}
