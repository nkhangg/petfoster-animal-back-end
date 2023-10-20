package com.poly.petfoster.service.impl;

import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;

import com.poly.petfoster.entity.Imgs;
import com.poly.petfoster.entity.Product;
import com.poly.petfoster.entity.ProductRepo;
import com.poly.petfoster.repository.ImgsRepository;
import com.poly.petfoster.repository.ProductRepository;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.ImagesService;

@Service
public class ImagesServiceImpl implements ImagesService{

    @Autowired
    ImgsRepository imgsRepository;

    @Autowired
    ProductRepository productRepository;

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
                images= null;
            }
        }
        return images;
    }

    @Override
    public ApiResponse deleteImgs(String id) {
       
        Product product = productRepository.findById(id).orElse(null);

        if(product == null) {
             return ApiResponse.builder().message("Product id is not exists").status(404).errors("PRODUCT_NOT_FOUND").build();
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
        if(imgFile.exists()) imgFile.delete();
    }
}
