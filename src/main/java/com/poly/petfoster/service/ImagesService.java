package com.poly.petfoster.service;

import com.poly.petfoster.response.ApiResponse;

public interface ImagesService {
    byte[] getImage(String fileName);

    ApiResponse deleteImgs(String id);

    ApiResponse getImagesByIdProduct(String id);
}
