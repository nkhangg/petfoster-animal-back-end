package com.poly.petfoster.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
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
import com.poly.petfoster.entity.ProductType;
import com.poly.petfoster.repository.ImagesRepository;
import com.poly.petfoster.repository.ProductRepoRepository;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.repository.ProductTypeRepository;
import com.poly.petfoster.request.CreateProductRequest;
import com.poly.petfoster.request.ProductRepoRequest;
import com.poly.petfoster.request.product.ProductInfoRequest;
import com.poly.petfoster.request.product.ProductRequest;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.common.PagiantionResponse;
import com.poly.petfoster.response.product_manage.ProductDetailManageResponse;
import com.poly.petfoster.response.product_manage.ProductInfoResponse;
import com.poly.petfoster.response.product_manage.ProductManageResponse;
import com.poly.petfoster.service.ProductService;
import com.poly.petfoster.ultils.PortUltil;

@Service
public class ProductServiceImpl implements ProductService {
        @Autowired
        private ProductRepository productRepository;

        @Autowired
        private ProductRepoRepository productRepoRepository;

        @Autowired
        private ProductTypeRepository productTypeRepository;

        @Autowired
        private PortUltil portUltil;

        @Autowired
        private ImagesRepository imagesRepository;

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
        public ApiResponse createProduct(ProductRequest productRequest) {
                Map<String, String> errorsMap = new HashMap<>();

                Integer lastId = Integer.parseInt(productRepository.findAll()
                                .get(productRepository.findAll().size() - 1).getId().substring(2, 6));
                System.out.println(lastId);
                String id = "PD0001";
                String newId = "PD0001";
                newId = newId.replace("01", String.valueOf(lastId + 1));

                Product product = Product.builder()
                                .id(newId)
                                .brand(productRequest.getBrand())
                                .productType(productTypeRepository.findById(productRequest.getProductType())
                                                .orElse(null))
                                .createAt(new Date())
                                .desc(productRequest.getDesc())
                                .isActive(true)
                                .name(productRequest.getName())
                                .build();

                productRepository.save(product);

                productRequest.getProductsRepo().forEach(item -> {
                        item.setProduct(product);
                });

                productRepoRepository.saveAll(productRequest.getProductsRepo());
                imagesRepository.save(Imgs.builder().nameImg("no-product-image.jpg").product(product).build());
                product.setProductsRepo(productRequest.getProductsRepo());
                product.setImgs(imagesRepository.findByProduct(product));

                return ApiResponse.builder()
                                .message("Query product Successfully")
                                .status(HttpStatus.OK.value())
                                .errors(false)
                                .data(product)
                                .build();
        };

        @Override
        public ApiResponse updateProduct(String id, ProductRequest productRequest) {
                Map<String, String> errorsMap = new HashMap<>();

                if (!productRepository.existsById(id)) {
                        return ApiResponse.builder()
                                        .message("Can't find Product ID")
                                        .status(404)
                                        .errors(errorsMap)
                                        .data(null)
                                        .build();
                }

                Product selectProduct = productRepository.findById(id).orElse(null);

                if (selectProduct == null) {
                        return ApiResponse.builder()
                                        .message("Can't find Product ID")
                                        .status(404)
                                        .errors(errorsMap)
                                        .data(null)
                                        .build();
                }

                if (!productRequest.getProductsRepo().isEmpty()) {
                        selectProduct.setProductsRepo(productRequest.getProductsRepo());

                        productRequest.getProductsRepo().stream().forEach(item -> {
                                item.setProduct(selectProduct);
                        });

                        productRequest.getProductsRepo().stream().forEach(item -> {

                                if (item.getId() == null) {
                                        productRepoRepository.save(item);
                                } else {
                                        if (!productRepoRepository.existsById(item.getId())) {
                                                productRepoRepository.save(item);
                                        }
                                }

                        });

                }

                ProductType type = productTypeRepository.findById(productRequest.getProductType()).orElse(null);

                if (type != null) {
                        selectProduct.setProductType(type);
                }

                selectProduct.setName(productRequest.getName());
                selectProduct.setBrand(productRequest.getBrand());
                selectProduct.setDesc(productRequest.getDesc());

                // Product selectProduct = productRepository.findById(id).orElse(null);

                return ApiResponse.builder()
                                .message("Query product Successfully")
                                .status(HttpStatus.OK.value())
                                .errors(null)
                                .data(productRepository.save(selectProduct))
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
                ProductDetailManageResponse data = ProductDetailManageResponse.builder()
                                .id(selectProduct.getId())
                                .name(selectProduct.getName())
                                .description(selectProduct.getDesc())
                                .brand(selectProduct.getBrand())
                                .type(selectProduct.getProductType().getName())
                                .repo(selectProduct.getProductsRepo())
                                .images(selectProduct.getImgs().stream().map((image) -> {
                                        Map<String, String> imageObj = new HashMap<>();
                                        imageObj.put("image", portUltil.getUrlImage(image.getNameImg()));
                                        imageObj.put("id", image.getId().toString());
                                        return imageObj;
                                }))
                                .build();

                return ApiResponse.builder()
                                .message("Query product Successfully")
                                .status(HttpStatus.OK.value())
                                .errors(null)
                                .data(data)
                                .build();
        }

        @Override
        public ApiResponse getProductInfo(String id) {

                if (id.isEmpty()) {
                        return ApiResponse.builder()
                                        .message("Id invalid")
                                        .status(HttpStatus.BAD_REQUEST.value())
                                        .errors(true)
                                        .data(null)
                                        .build();
                }

                Product selectProduct = productRepository.findById(id).orElse(null);

                if (selectProduct == null) {
                        return ApiResponse.builder()
                                        .message("Can't found product by id")
                                        .status(404)
                                        .errors(true)
                                        .data(null)
                                        .build();
                }

                return ApiResponse.builder()
                                .message("Successfuly !")
                                .status(HttpStatus.OK.value())
                                .errors(false)
                                .data(ProductInfoResponse.builder()
                                                .id(selectProduct.getId())
                                                .name(selectProduct.getName())
                                                .brand(selectProduct.getBrand())
                                                .type(selectProduct.getProductType().getId())
                                                .description(selectProduct.getDesc())
                                                .build())
                                .build();
        }

        @Override
        public ApiResponse updateProductWithInfo(String id, ProductInfoRequest productInfoRequest) {

                System.out.println(id);
                System.out.println(productInfoRequest);

                if (id.isEmpty() || !id.equals(productInfoRequest.getId())) {
                        return ApiResponse.builder()
                                        .message("Id invalid")
                                        .status(HttpStatus.BAD_REQUEST.value())
                                        .errors(true)
                                        .data(null)
                                        .build();
                }

                Product selectProduct = productRepository.findById(id).orElse(null);

                if (selectProduct == null) {
                        return ApiResponse.builder()
                                        .message("Can't found product by id")
                                        .status(404)
                                        .errors(true)
                                        .data(null)
                                        .build();
                }

                // all good
                selectProduct.setBrand(productInfoRequest.getBrand());
                selectProduct.setProductType(getNewTypeForProduct(productInfoRequest.getType(), selectProduct));
                selectProduct.setName(productInfoRequest.getName());
                selectProduct.setDesc(productInfoRequest.getDescription());

                return ApiResponse.builder()
                                .message("Update product successfully")
                                .status(HttpStatus.OK.value())
                                .errors(null)
                                .data(productRepository.save(selectProduct))
                                .build();
        };

        public ProductType getNewTypeForProduct(String idType, Product product) {

                if (idType.equals(product.getProductType().getId())) {
                        return product.getProductType();
                }

                ProductType newType = productTypeRepository.findById(idType).orElse(null);

                if (newType == null) {
                        return product.getProductType();
                }

                return newType;
        }

        @Override
        public ApiResponse createProduct2(CreateProductRequest createProductRequest, List<MultipartFile> images) {
                
                Product product = Product.builder()
                        .id("111111")
                        .brand(createProductRequest.getBrand())
                        .desc(createProductRequest.getDescription())
                        .build();
                
                productRepository.save(product);

                ProductType productType = productTypeRepository.findById(createProductRequest.getType()).orElse(null);

                if(productType == null) {
                        return ApiResponse.builder().message("Type id is not exists").status(404).errors("PRODUCT_TYPE_NOT_FOUND").build();
                }

                List<ProductRepo> repos = new ArrayList<>();
                for (ProductRepoRequest productRepo : createProductRequest.getRepo()) {
                        ProductRepo repo = ProductRepo.builder()
                                .size(productRepo.getSize())
                                .inPrice(productRepo.getInPrice().doubleValue())
                                .outPrice(productRepo.getOutPrice().doubleValue())
                                .quantity(productRepo.getQuantity())
                                .build();
                        productRepoRepository.save(repo);
                        repos.add(repo);
                }
                
                // List<MultipartFile> imgs
                String data = "";
                List<Imgs> imgs = new ArrayList<>();
                for (MultipartFile img : images) {
                        String imgName = img.getOriginalFilename();
                        try {
                            String dir = "images/";
                            File file = new File(dir, imgName);

                            if(!file.exists()) {
                                file.createNewFile();
                            }
                            
                        //     img.transferTo(file);
                        FileOutputStream fos = new FileOutputStream(file);
                        fos.write(img.getBytes());
                        fos.close();
                            data = imgName;
                            
                        } catch (Exception e) {
                           e.getMessage();
                        }
                        imgs.add(Imgs.builder().product(product).nameImg(imgName).build());
                }

                product.setProductType(productType);
                product.setProductsRepo(repos);
                product.setImgs(imgs);

                return ApiResponse.builder().message(data).build();
        }
}
