package com.poly.petfoster.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.Imgs;
import com.poly.petfoster.entity.Product;
import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.entity.ProductType;
import com.poly.petfoster.repository.ImgsRepository;
import com.poly.petfoster.repository.ProductRepoRepository;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.repository.ProductTypeRespository;
import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.ProductResponse;
import com.poly.petfoster.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
        @Autowired
        private ProductRepository productRepository;
        @Autowired
        private ProductTypeRespository productTypeRepository;
        @Autowired
        private ProductRepoRepository productRepoRepository;
        @Autowired
        private ImgsRepository imgsRepository;

        @Override
        public ApiResponse getAllProduct() {

                Map<String, String> errorsMap = new HashMap<>();

                return ApiResponse.builder()
                                .message("Query product Successfully")
                                .status(null)
                                .errors(errorsMap)
                                .data(productRepository.findAll())
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
                                        .data(null)
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
                                .data(data)
                                .build();
        };

        @Override
        public ApiResponse createProduct(ProductRequest ProductReq) {
                Map<String, String> errorsMap = new HashMap<>();

                if (productRepository.existsById(ProductReq.getId())) {
                        errorsMap.put("null", "null");
                        return ApiResponse.builder()
                                        .message("Product ID already!")
                                        .status(null)
                                        .errors(errorsMap)
                                        .data(null)
                                        .build();

                }
                // System.out.println(ProductReq.getProductType());
                // System.out.println(ProductReq.getProductsRepo());
                // System.out.println(ProductReq.getImgs());
                // ProductType newProductType = ProductType.builder()
                // .id(ProductReq.getProductType().getId())
                // .name(ProductReq.getProductType().getName())
                // .build();

                // productTypeRepository.findById(ProductReq.getProductType().getId());
                Product newProduct = Product.builder()
                                .id(ProductReq.getId())
                                .name(ProductReq.getName())
                                .desc(ProductReq.getDesc())
                                .isActive(ProductReq.getIsActive())
                                // .productType(ProductReq.getProductType())
                                // .productsRepo(ProductReq.getProductsRepo())
                                .build();
                productRepository.save(newProduct);

                newProduct.setProductType(ProductReq.getProductType());

                for (ProductRepo e : ProductReq.getProductsRepo()) {
                        e.setProduct(newProduct);
                        productRepoRepository.save(e);
                }
                newProduct.setProductsRepo(ProductReq.getProductsRepo());

                for (Imgs e : ProductReq.getImgs()) {
                        e.setProduct(newProduct);
                        imgsRepository.save(e);
                }
                newProduct.setImgs(ProductReq.getImgs());

                productRepository.save(newProduct);

                Product selectProduct = productRepository.findById(ProductReq.getId()).orElse(null);

                if (selectProduct == null) {
                        return ApiResponse.builder()
                                        .message("Can't found Product ID")
                                        .status(HttpStatus.OK.value())
                                        .errors(null)
                                        .data(null)
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
                                .data(data)
                                .build();
        };

        @Override
        public ApiResponse updateProduct(String id, ProductRequest ProductReq) {
                Map<String, String> errorsMap = new HashMap<>();

                if (productRepository.existsById(ProductReq.getId())) {

                        Product updateProduct = Product.builder()
                                        .id(id)
                                        .name(ProductReq.getName())
                                        .desc(ProductReq.getDesc())
                                        .isActive(ProductReq.getIsActive())
                                        // .productType(ProductReq.getProductType())
                                        // .productsRepo(ProductReq.getProductsRepo())
                                        .build();
                        productRepository.save(updateProduct);
                        updateProduct.setProductType(ProductReq.getProductType());

                        for (ProductRepo e : ProductReq.getProductsRepo()) {
                                e.setProduct(updateProduct);
                                productRepoRepository.save(e);
                        }
                        updateProduct.setProductsRepo(ProductReq.getProductsRepo());

                        for (Imgs e : ProductReq.getImgs()) {
                                e.setProduct(updateProduct);
                                imgsRepository.save(e);
                        }
                        updateProduct.setImgs(ProductReq.getImgs());

                        productRepository.save(updateProduct);

                } else {
                        return ApiResponse.builder()
                                        .message("Can't find Product ID")
                                        .status(null)
                                        .errors(errorsMap)
                                        .data(null)
                                        .build();
                }

                Product selectProduct = productRepository.findById(id).orElse(null);

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
                                .data(data)
                                .build();
        };

        @Override
        public ApiResponse deleteProduct(String id) {
                Map<String, String> errorsMap = new HashMap<>();


                if (productRepository.existsById(id)) {
                Product selectProduct1 = productRepository.findById(id).orElse(null);

                       Product updateProduct = Product.builder()
                                        .id(id)
                                        .name(selectProduct1.getName())
                                        .desc(selectProduct1.getDesc())
                                        .isActive(false)
                                        .productType(selectProduct1.getProductType())
                                        // .productsRepo(ProductReq.getProductsRepo())
                                        .build();
                        productRepository.save(updateProduct);
                        // updateProduct.setProductType(selectProduct1.getProductType());
                        // productRepository.save(updateProduct);

                } else {
                        return ApiResponse.builder()
                                        .message("Can't find Product ID")
                                        .status(null)
                                        .errors(errorsMap)
                                        .data(null)
                                        .build();
                }

                Product selectProduct = productRepository.findById(id).orElse(null);

                if (selectProduct == null) {
                        return ApiResponse.builder()
                                        .message("Can't found Product ID")
                                        .status(HttpStatus.OK.value())
                                        .errors(null)
                                        .data(null)
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
                                .data(data)
                                .build();        
        };
}
