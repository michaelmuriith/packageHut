package com.packageHut.api.service;

import com.packageHut.api.common.JwtTokenUtil;
import com.packageHut.api.common.TokenUtil;
import com.packageHut.api.model.Shop;
import com.packageHut.api.repository.ProductRepository;
import com.packageHut.api.dto.request.CreateProductRequest;
import com.packageHut.api.model.Product;
import com.packageHut.api.repository.ShopRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {
    private final JwtTokenUtil jwtTokenUtil;
    private final UserService userService;
    private final ShopService shopService;
    private final TokenUtil tokenUtil;
    private final ProductRepository productRepository;
    private final ShopRepository shopRepository;

    public Product createProduct(CreateProductRequest createProductRequest, String token, String shopId) {
        //validate user
        tokenUtil.validateToken(token);
        //check if user is a shop owner
        userService.checkIfUserIsTheShopOwner(token, shopId);
        //add product
        Product product = Product.builder()
                .productId(UUID.randomUUID().toString())
                .shop(shopService.getShop(shopId))
                .product_name(createProductRequest.getProduct_name())
                .product_description(createProductRequest.getProduct_description())
                .product_price(createProductRequest.getProduct_price())
                .product_image(createProductRequest.getProduct_image())
                .product_category(createProductRequest.getProduct_category())
                .product_quantity(createProductRequest.getProduct_quantity())
                .product_status(createProductRequest.getProduct_status())
                .product_created_at(String.valueOf(new Date()))
                .product_updated_at(String.valueOf(new Date()))
                .build();

        return productRepository.save(product);
    }

    public Product getProduct(String product_id) {
        return productRepository.findByProductId(product_id);
    }

    public List<Product> getProducts() {
        return productRepository.findAll();
    }
}
