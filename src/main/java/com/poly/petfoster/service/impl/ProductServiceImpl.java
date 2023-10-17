package com.poly.petfoster.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poly.petfoster.constant.RespMessage;
import com.poly.petfoster.entity.Imgs;
import com.poly.petfoster.entity.Product;
import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.repository.ImgsRepository;
import com.poly.petfoster.repository.ProductRepoRepository;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.repository.ProductTypeRespository;
import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.ProductResponse;
import com.poly.petfoster.response.common.PagiantionResponse;
import com.poly.petfoster.response.product_manage.ProductDetailManageResponse;
import com.poly.petfoster.response.product_manage.ProductManageResponse;
import com.poly.petfoster.service.ProductService;
import com.poly.petfoster.ultils.PortUltil;


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

        @Autowired
        private PortUltil portUltil;

        @Override
        public ApiResponse getAllProduct(Optional<Integer> page) {

                List<ProductManageResponse> productItems = new ArrayList<>();
                List<Product> products = productRepository.findAll();

                Pageable pageable = PageRequest.of(page.orElse(0), 10);
                int startIndex = (int) pageable.getOffset();
                int endIndex = Math.min(startIndex + pageable.getPageSize(), products.size());

                if (startIndex >= endIndex) {
                        return ApiResponse.builder()
                                        .message(RespMessage.NOT_FOUND.getValue())
                                        .data(null)
                                        .errors(true)
                                        .status(HttpStatus.NOT_FOUND.value())
                                        .build();
                }

                List<Product> visibleProducts = products.subList(startIndex, endIndex);

                visibleProducts.stream().forEach(product -> {
                        productItems.add(ProductManageResponse.builder()
                                        .id(product.getId())
                                        .image(portUltil.getUrlImage(product.getImgs().get(0).getNameImg()))
                                        .brand(product.getBrand())
                                        .name(product.getName())
                                        .type(product.getProductType().getName())
                                        .repo(productRepoRepository.findByProduct(product))
                                        .build());
                });

                Page<ProductManageResponse> pagination = new PageImpl<ProductManageResponse>(productItems, pageable,
                                products.size());

                return ApiResponse.builder()
                                .message("Query product Successfully")
                                .status(HttpStatus.OK.value())
                                .errors(false)
                                .data(PagiantionResponse.builder().data(pagination.getContent())
                                                .pages(pagination.getTotalPages()).build())
                                .build();
        }

        

        @Override
        public ApiResponse createProduct(ProductRequest ProductReq, List<MultipartFile> listImgs) {
                Map<String, String> errorsMap = new HashMap<>();

                // if (productRepository.existsById(ProductReq.getId())) {
                // errorsMap.put("null", "null");
                // return ApiResponse.builder()
                // .message("Product ID already!")
                // .status(null)
                // .errors(errorsMap)
                // .data(null)
                // .build();

                // }
                // System.out.println(ProductReq);
                // System.out.println(ProductReq.getProductsRepo());
                // System.out.println(ProductReq.getImgs());
                // ProductType newProductType = ProductType.builder()
                // .id(ProductReq.getProductType().getId())
                // .name(ProductReq.getProductType().getName())
                // .build();

                // productTypeRepository.findById(ProductReq.getProductType().getId());

                Integer lastId = Integer.parseInt(productRepository.findAll()
                                .get(productRepository.findAll().size() - 1).getId().substring(2, 6));
                System.out.println(lastId);
                String id = "PD0001";
                String newId = "PD0001";
                newId = newId.replace("01", String.valueOf(lastId + 1));
                System.out.println(newId);
                Product newProduct = Product.builder()
                                .id(newId)
                                .name(ProductReq.getName())
                                .desc(ProductReq.getDesc())
                                .isActive(true)
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

                newProduct.setCreateAt(productRepository.findById(newId).get().getCreateAt());

                productRepository.save(newProduct);

                Product selectProduct = productRepository.findById(newId).orElse(null);

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
        public ApiResponse updateProduct(String id, ProductRequest ProductReq, List<MultipartFile> listImgs) {
                Map<String, String> errorsMap = new HashMap<>();

                if (productRepository.existsById(id)) {
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
                                                img.setProduct(updateProduct);
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
                        updateProduct.setImgs(listImgsProduct);

                        // updateProduct.setCreateAt(productRepository.findById(id).get().getCreateAt());
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

                if (!productRepository.existsById(id))
                        return ApiResponse.builder()
                                        .message("Can't found Product ID")
                                        .status(HttpStatus.NOT_FOUND.value())
                                        .errors(null)
                                        .data(null)
                                        .build();

                Product selectProduct = productRepository.findById(id).orElse(null);

                if (selectProduct == null) {
                        return ApiResponse.builder()
                                        .message("Can't found Product ID")
                                        .status(HttpStatus.OK.value())
                                        .errors(null)
                                        .data(null)
                                        .build();
                }

                // set active
                selectProduct.setIsActive(false);

                return ApiResponse.builder()
                                .message("Query product Successfully")
                                .status(HttpStatus.OK.value())
                                .errors(null)
                                .data(productRepository.save(selectProduct))
                                .build();
        };
}
