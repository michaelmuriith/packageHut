package com.packageHut.api.controller;

import com.packageHut.api.dto.request.CreateShopRequest;
import com.packageHut.api.model.Product;
import com.packageHut.api.model.Shop;
import com.packageHut.api.service.ShopService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/shop")
@RequiredArgsConstructor
public class ShopController {
    final ShopService shopService;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Shop createShop(@RequestBody CreateShopRequest shopCreateRequest, @RequestHeader("Authorization") String token) {
        return shopService.createShop(shopCreateRequest, token);
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public Iterable<Shop> getShops() {
        return shopService.getShops();
    }


    //get shops products
    @GetMapping("/{shop_id}")
    @ResponseStatus(HttpStatus.OK)
    public Iterable<Product> getShopProducts(@PathVariable String shop_id) {
        return shopService.getShopProducts(shop_id);
    }

}
