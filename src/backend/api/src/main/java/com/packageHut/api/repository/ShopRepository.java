package com.packageHut.api.repository;

import com.packageHut.api.model.Shop;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShopRepository extends JpaRepository<Shop, Long> {
    Shop findByShopId(String shopId);
}
