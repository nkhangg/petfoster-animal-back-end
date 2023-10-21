package com.poly.petfoster.service.impl;

import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;

import com.poly.petfoster.entity.Imgs;
import com.poly.petfoster.entity.Product;
import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.repository.ImgsRepository;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.images.ImageResponse;
import com.poly.petfoster.service.ImagesService;
import com.poly.petfoster.ultils.PortUltil;

@Service
public class ImagesServiceImpl implements ImagesService {

    @Autowired
    ImgsRepository imgsRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    PortUltil portUltil;

    @Override
    public byte[] getImage(String fileName) {
        String filePath = "images/" + fileName;

        byte[] images;
        try {
            images = Files.readAllBytes(new File(filePath).toPath());
        } catch (IOException e) {
            try {
                images = Files.readAllBytes(new File("images/no-product-image.jpg").toPath());
            } catch (IOException e1) {
                System.out.println("Error in getImage" + e.getMessage());
                images = null;
            }
        }
        return images;
    }

    @Override
    public ApiResponse deleteImgs(String id) {

        Product product = productRepository.findById(id).orElse(null);

        if (product == null) {
            return ApiResponse.builder().message("Product id is not exists").status(404).errors("PRODUCT_NOT_FOUND")
                    .build();
        }

        List<Imgs> imgs = imgsRepository.getImgsByProductId(id);
        for (Imgs img : imgs) {
            String fileName = img.getNameImg();
            deleteImg(fileName);
        }

        return ApiResponse.builder().message("Successfully").status(200).errors(false).data(imgs).build();
    }

    public void deleteImg(String fileName) {
        File imgFile = new File("images/" + fileName);
        if (imgFile.exists())
            imgFile.delete();
    }

    @Override
    public ApiResponse getImagesByIdProduct(String id) {

        if (id.isEmpty()) {
            return ApiResponse.builder()
                    .message("Product id is not exists")
                    .status(404)
                    .errors(true)
                    .data(null)
                    .build();
        }

        List<Imgs> images = imgsRepository.getImgsByProductId(id);

        if (images.isEmpty()) {
            return ApiResponse.builder()
                    .message("Images is not empty")
                    .status(404)
                    .errors(true)
                    .data(null)
                    .build();
        }

        List<ImageResponse> imageResponses = images.stream().map((item) -> {
            return ImageResponse.builder()
                    .id(item.getId())
                    .name(item.getNameImg())
                    .image(portUltil.getUrlImage(item.getNameImg()))
                    .build();
        }).toList();

        return ApiResponse.builder()
                .message("Images successfuly")
                .status(HttpStatus.OK.value())
                .errors(false)
                .data(imageResponses)
                .build();

    }
}
