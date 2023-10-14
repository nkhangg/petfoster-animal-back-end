package com.poly.petfoster.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.Imgs;
import com.poly.petfoster.entity.Product;
import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.product_details.ProductDetail;
import com.poly.petfoster.response.product_details.SizeAndPrice;
import com.poly.petfoster.response.takeaction.ProductItem;
import com.poly.petfoster.service.ProductDetailsService;
import com.poly.petfoster.ultils.PortUltil;

@Service
public class ProductDetailsServiceImpl implements ProductDetailsService {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    TakeActionServiceImpl takeActionServiceImpl;

    @Autowired
    PortUltil portUltil;

    @Override
    public ApiResponse productDetails(String id) {

        Map<String, String> errorMap = new HashMap<>();

        Product product = productRepository.findById(id).orElse(null);

        if(product == null) {
            errorMap.put("product id", "product id is not exists!!!");
            return ApiResponse.builder()
                    .message("Failture!!!")
                    .status(400)
                    .errors(errorMap)
                    .build();
        }

        ProductItem productItem = takeActionServiceImpl.createProductTakeAction(product);

        return ApiResponse.builder()
                        .message("Successfully!!!")
                        .status(200)
                        .errors(false)
                        .data(
                            ProductDetail.builder()
                                        .id(productItem.getId())
                                        .name(productItem.getName())
                                        .brand(productItem.getBrand())
                                        .discount(productItem.getDiscount())
                                        .image(productItem.getImage())
                                        .images(getImgNames(product))
                                        .rating(productItem.getRating())
                                        .desciption(product.getDesc())
                                        .sizeAndPrice(getSizeAndPrices(product))
                                        .suggestions(getSuggestionProducts(id))
                                        .build()
                        )
                        .build();
    }
    

    public List<String> getImgNames(Product product) {
       
        List<String> imgs = new ArrayList<>();

        for (Imgs img : product.getImgs()) {
            imgs.add(portUltil.getUrlImage(img.getNameImg()));
        }

        return imgs;
    }


    public List<SizeAndPrice> getSizeAndPrices(Product product) {

        int discount = 8;
        List<SizeAndPrice> sizeAndprices = new ArrayList<>();

        for(ProductRepo productRepo : product.getProductsRepo()) {
            sizeAndprices.add(SizeAndPrice.builder()
                                .size(productRepo.getSize())
                                .price(productRepo.getOutPrice())
                                .oldPrice(productRepo.getOutPrice() + (productRepo.getOutPrice() * (discount / 100.0)))
                                .repo(productRepo.getId())
                                .build());
        }

        return sizeAndprices;
    }

    public List<ProductItem> getSuggestionProducts(String id) {

        List<Product> sameTypeProducts = productRepository.getSameTypeProducts(id);
        List<ProductItem> suggesstionProducts = new ArrayList<>();

        for(Product sameTypeProduct : sameTypeProducts) {
            suggesstionProducts.add(takeActionServiceImpl.createProductTakeAction(sameTypeProduct));
        }

        return suggesstionProducts;
    }
}
