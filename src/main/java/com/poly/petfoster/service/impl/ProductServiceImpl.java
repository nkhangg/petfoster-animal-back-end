package com.poly.petfoster.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poly.petfoster.constant.RespMessage;
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
import com.poly.petfoster.ultils.PortUltil;
import com.poly.petfoster.ultils.ImageUtils;

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
        @Autowired
        PortUltil portUltil;

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
                                .brand(selectProduct.getBrand())
                                .createAt(selectProduct.getCreateAt())
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
        public ApiResponse createProduct(ProductRequest ProductReq, List<MultipartFile> listImgs) {
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
                System.out.println(ProductReq);
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
                                .brand(ProductReq.getBrand())
                                // .createAt(null)
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

                List<Imgs> listImgsProduct = new ArrayList<>();
                for (MultipartFile item : listImgs) {
                        if (item.getSize() > 500000) {
                                errorsMap.put("Imgs", "Image size is too large");
                        } else {
                                try {
                                        File file = ImageUtils.createFileImage();
                                        item.transferTo(new File(file.getAbsolutePath()));
                                        Imgs img = new Imgs();
                                        img.setNameImg(file.getName());
                                        img.setProduct(newProduct);
                                        listImgsProduct.add(img);
                                } catch (Exception e) {
                                        e.printStackTrace();
                                        return ApiResponse.builder()
                                                        .message(RespMessage.INTERNAL_SERVER_ERROR.getValue())
                                                        .errors(true)
                                                        .status(500)
                                                        .data(null)
                                                        .build();
                                }
                                // e.setProduct(newProduct);
                                // imgsRepository.save(e);
                        }
                }
                newProduct.setImgs(listImgsProduct);

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
                                .brand(selectProduct.getBrand())
                                .createAt(selectProduct.getCreateAt())
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
                        Product selectProduct2 = productRepository.findById(id).orElse(null);

                        Product updateProduct = Product.builder()
                                        .id(id)
                                        .name(ProductReq.getName())
                                        .desc(ProductReq.getDesc())
                                        .isActive(ProductReq.getIsActive())
                                        .brand(ProductReq.getBrand())
                                        .createAt(selectProduct2.getCreateAt())
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
                        //
                        List<Imgs> listImgs = new ArrayList<>();
                        
                        // for (MultipartFile item : ProductReq.getImgs()) {
                        //         if (item.getSize() > 500000) {
                        //                 errorsMap.put("Imgs", "Image size is too large");
                        //         } else {
                        //                 try {
                        //                         File file = ImageUtils.createFileImage();
                        //                         item.transferTo(new File(file.getAbsolutePath()));
                        //                         Imgs img = new Imgs();
                        //                         img.setNameImg(file.getName());
                        //                         img.setProduct(updateProduct);
                        //                         listImgs.add(img);
                        //                 } catch (Exception e) {
                        //                         e.printStackTrace();
                        //                         return ApiResponse.builder()
                        //                                         .message(RespMessage.INTERNAL_SERVER_ERROR.getValue())
                        //                                         .errors(true)
                        //                                         .status(500)
                        //                                         .data(null)
                        //                                         .build();
                        //                 }
                        //                 // e.setProduct(newProduct);
                        //                 // imgsRepository.save(e);
                        //         }
                        // }

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
                                .brand(selectProduct.getBrand())
                                .createAt(selectProduct.getCreateAt())
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
                                        .brand(selectProduct1.getBrand())
                                        .productType(selectProduct1.getProductType())
                                        .createAt(selectProduct1.getCreateAt())
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
                                .brand(selectProduct.getBrand())
                                .createAt(selectProduct.getCreateAt())
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
