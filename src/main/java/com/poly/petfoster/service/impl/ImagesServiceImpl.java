package com.poly.petfoster.service.impl;

import java.nio.file.Files;

import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;

import com.poly.petfoster.service.ImagesService;

@Service
public class ImagesServiceImpl implements ImagesService{

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
    
}
