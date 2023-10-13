package com.poly.petfoster.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.Product;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.ProductResponse;
import com.poly.petfoster.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Override
    public ApiResponse getAllProduct() {

        Map<String, String> errorsMap = new HashMap<>();

        return ApiResponse.builder()
                .message("Query product Successfully")
                .status(null)
                .errors(errorsMap)
                .data(
                        productRepository.findAll())
                .build();
    }

    @Override
    public ApiResponse getProduct(String id) {
        Map<String, String> errorsMap = new HashMap<>();


        Product selectProduct = productRepository.findById(id).orElse(null);

        // List<Product> list = new ArrayList<>();
        // productRepository.save(null);
        // list.add(productRepository.findAll());
        if (selectProduct == null) {
            return ApiResponse.builder()
                    .message("Can't found Product ID")
                    .status(HttpStatus.OK.value())
                    .errors(null)
                    .data(
                            null)
                    .build();
        }
        ProductResponse data = ProductResponse.builder()
                .id(selectProduct.getId())
                .name(selectProduct.getName())
                .desc(selectProduct.getDesc())
                .productType(selectProduct.getProductType())
                .isActive(selectProduct.getIsActive())
                .productsRepo(selectProduct.getProductsRepo())
                .imgs(selectProduct.getImgs())
                .build();

        return ApiResponse.builder()
                .message("Query product Successfully")
                .status(HttpStatus.OK.value())
                .errors(null)
                .data(
                        data)
                .build();
    };

    @Override
    public ApiResponse createProduct(ProductRequest ProductReq) {
        Map<String, String> errorsMap = new HashMap<>();

       if (productRepository.existsById(ProductReq.getId())){
            errorsMap.put("null", "null");
            return ApiResponse.builder()
                .message("Product ID already!")
                .status(null)
                .errors(errorsMap)
                .data(
                        null)
                .build();

       }
       System.out.println(ProductReq.getProductType());
       System.out.println(ProductReq.getProductsRepo());
       System.out.println(ProductReq.getImgs());
       Product newProduct = Product .builder()
                                .id(ProductReq.getId())
                                .name(ProductReq.getName())
                                .desc(ProductReq.getDesc())
                                .isActive(ProductReq.getIsActive())
                                .productType(ProductReq.getProductType())
                                .productsRepo(ProductReq.getProductsRepo())
                                .imgs(ProductReq.getImgs())
                                .build();

       productRepository.save(newProduct);

       return ApiResponse.builder()
                .message("Query product Successfully")
                .status(null)
                .errors(errorsMap)
                .data(
                productRepository.findById(ProductReq.getId())
                )
                .build();
    };

    @Override
    public ApiResponse updateProduct(String id, ProductRequest ProductReq) {
        Map<String, String> errorsMap = new HashMap<>();

      return ApiResponse.builder()
                .message("Query product Successfully")
                .status(null)
                .errors(errorsMap)
                .data(
                        productRepository.findAll())
                .build();
    };

    @Override
    public ApiResponse deleteProduct(String id, ProductRequest ProductReq) {
        Map<String, String> errorsMap = new HashMap<>();

       return ApiResponse.builder()
                .message("Query product Successfully")
                .status(null)
                .errors(errorsMap)
                .data(
                        productRepository.findAll())
                .build();
    };
}
