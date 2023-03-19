package com.packageHut.api.controller;

import com.packageHut.api.dto.request.CreateProductRequest;
import com.packageHut.api.model.Product;
import com.packageHut.api.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/product")
@RequiredArgsConstructor
public class ProductController {
    final ProductService productService;

    @PostMapping("/{shopId}")
    @ResponseStatus(HttpStatus.CREATED)
    public Product createProduct(@RequestBody CreateProductRequest productCreateRequest, @RequestHeader("Authorization") String token, @PathVariable String shopId) {
        return productService.createProduct(productCreateRequest, token, shopId);
    }

    @GetMapping("/{product_id}")
    @ResponseStatus(HttpStatus.OK)
    public Product getProduct(@PathVariable String product_id) {
        return productService.getProduct(product_id);
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public Iterable<Product> getProducts() {
        return productService.getProducts();
    }
}
