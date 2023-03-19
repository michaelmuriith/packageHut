package com.packageHut.api.service;

import com.packageHut.api.model.*;
import com.packageHut.api.dto.request.OrderRequest;
import com.packageHut.api.repository.OrderRepository;
import com.packageHut.api.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional
public class OrderService {
    final UserService userService;
    final ShopService shopService;

    final OrderRepository orderRepository;
    final UserRepository userRepository;

    //place order
    public String placeOrder(OrderRequest orderRequest, String jwt) {
        Order order = new Order();
        order.setOrderNumber(UUID.randomUUID().toString());

        // get user
        User user = userService.getUserByToken(jwt);

        // get products from all shops
        List<Shop> shops = new ArrayList<>();
        List<OrderLineItem> orderLineItems = new ArrayList<>();
        BigDecimal orderTotal = BigDecimal.ZERO;
        for (CartItem cartItem : user.getCart().getCartItems()) {
            Product product = cartItem.getProduct();
            Shop shop = product.getShop();
            if (!shops.contains(shop)) {
                shops.add(shop);
            }
            BigDecimal price = product.getProduct_price();
            BigDecimal quantity = new BigDecimal(cartItem.getQuantity());
            BigDecimal itemTotal = price.multiply(quantity);
            orderTotal = orderTotal.add(itemTotal);
            OrderLineItem orderLineItem = new OrderLineItem();
            orderLineItem.setProduct(product);
            orderLineItem.setQuantity(cartItem.getQuantity());
            orderLineItem.setPrice(price);
            orderLineItem.setItemTotal(itemTotal);
            orderLineItems.add(orderLineItem);
        }

        // create orders for each shop
        for (Shop shop : shops) {
            Order shopOrder = new Order();
            shopOrder.setOrderNumber(UUID.randomUUID().toString());
            shopOrder.setUser(user);
            shopOrder.setShop(shop);
            shopOrder.setOrderLineItems(new ArrayList<>());
            BigDecimal shopTotal = BigDecimal.ZERO;
            for (OrderLineItem orderLineItem : orderLineItems) {
                if (orderLineItem.getProduct().getShop().equals(shop)) {
                    shopOrder.getOrderLineItems().add(orderLineItem);
                    shopTotal = shopTotal.add(orderLineItem.getItemTotal());
                }
            }
            shopOrder.setOrderTotal(shopTotal);
            // save shop order
            orderRepository.save(shopOrder);
        }

        // clear cart
        user.getCart().getCartItems().clear();
        userRepository.save(user);

        return "Order placed successfully";
    }

    //get order
    //get all orders by user

}
