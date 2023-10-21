package com.poly.petfoster.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.Product;
import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.repository.CartRepository;
import com.poly.petfoster.repository.ImagesRepository;
import com.poly.petfoster.repository.ProductRepoRepository;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.request.cart.CartItemRequest;
import com.poly.petfoster.request.cart.UpdateCartRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.CartItemResponse;
import com.poly.petfoster.response.CartResponse;
import com.poly.petfoster.response.ProductResponse;
import com.poly.petfoster.response.common.PagiantionResponse;
import com.poly.petfoster.service.CartService;
import com.poly.petfoster.ultils.PortUltil;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartRepository cartRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductRepoRepository productRepoRepository;

    @Autowired
    PortUltil portUltil;

    @Override
    public ApiResponse getListCart(UpdateCartRequest updateCartRequest) {

        List<CartItemResponse> listCartItemResponses = new ArrayList<>();

        for (CartItemRequest cartItemRequest : updateCartRequest.getListCart()) {
            Product product = productRepository.findById(cartItemRequest.getId()).orElse(null);

            ProductRepo productRepo = productRepoRepository.findProductRepoByIdAndSize(cartItemRequest.getId(), cartItemRequest.getSize());

            if (product == null) {
                return ApiResponse.builder().message("Product isn't exists!")
                        .status(404)
                        .errors("PRODUCT_NOT_FOUND")
                        .data(null)
                        .build();
            }

            CartItemResponse cartItemResponse = CartItemResponse.builder()
                    .id(product.getId())
                    .brand(product.getBrand())
                    .name(product.getName())
                    .image(portUltil.getUrlImage(product.getImgs().get(0).getNameImg()))
                    .price(productRepo.getOutPrice().intValue())
                    .repo(productRepo.getQuantity())
                    .size(productRepo.getSize())
                    .build();

            listCartItemResponses.add(cartItemResponse);

        }
        
        

        return ApiResponse.builder().message("Successfully!")
                .status(200)
                .errors(false)
                .data(listCartItemResponses)
                .build();
    }

}
