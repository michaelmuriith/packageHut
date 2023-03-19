package com.packageHut.api.service;

import com.packageHut.api.dto.request.OrderLineItemsDto;
import com.packageHut.api.model.Order;
import com.packageHut.api.model.OrderLineItems;
import com.packageHut.api.model.Product;
import com.packageHut.api.dto.request.OrderRequest;
import com.packageHut.api.model.User;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional
public class OrderService {
    final UserService userService;

    //place order
    public String placeOrder(OrderRequest orderRequest, String jwt) {
        Order order = new Order();
        order.setOrderId(UUID.randomUUID().toString());

        List<OrderLineItems> orderLineItems = orderRequest.getOrderLineItemsDtoList()
                .stream()
                .map(this::mapToDto)
                .toList();

        order.setOrderLineItems(orderLineItems);

    }

    private OrderLineItems mapToDto(OrderLineItemsDto orderLineItemsDto) {
        OrderLineItems orderLineItems = new OrderLineItems();
        OrderLineItems.
        return orderLineItems;
    }
    //get order
    //get all orders by user

}
