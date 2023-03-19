package com.packageHut.api.service;

import com.packageHut.api.common.JwtTokenUtil;
import com.packageHut.api.common.TokenUtil;
import com.packageHut.api.dto.request.CreateShopRequest;
import com.packageHut.api.model.Product;
import com.packageHut.api.model.Shop;
import com.packageHut.api.model.User;
import com.packageHut.api.repository.ShopRepository;
import com.packageHut.api.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class ShopService {
    private final ShopRepository shopRepository;
    private final UserService userService;

    private final UserRepository userRepository;
    private final TokenUtil tokenUtil;

    private final JwtTokenUtil jwtTokenUtil;
    // create shop
    public Shop createShop(CreateShopRequest createShopRequest, String token) {

        //validate user
        tokenUtil.validateToken(token);
        //Get user
        User user = tokenUtil.getUser(token);

        Shop shop = Shop.builder()
                .shopId(UUID.randomUUID().toString())
                .shopName(createShopRequest.getShop_name())
                .shopLogo(createShopRequest.getShop_logo())
                .shop_address(createShopRequest.getShop_address())
                .shop_phone(createShopRequest.getShop_phone())
                .shop_email(createShopRequest.getShop_email())
                .build();

        shopRepository.save(shop); // save shop object first to assign an ID

        user.setShop(shop); // update user's shop relationship
        userRepository.save(user); // save user object

        return shop; // return the saved shop object
    }

    // get shop
    public Shop getShop(String shop_id) {
        return shopRepository.findByShopId(shop_id);
    }

    // get all shops
    public List<Shop> getShops() {
        return shopRepository.findAll();
    }

    //get shops products
    public Iterable<Product> getShopProducts(String shop_id) {
        return shopRepository.findByShopId(shop_id).getProducts();
    }
}
