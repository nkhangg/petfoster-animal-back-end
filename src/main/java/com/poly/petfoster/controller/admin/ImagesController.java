package com.poly.petfoster.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.ImagesService;

@RestController
@RequestMapping("/api/admin/images")
public class ImagesController {

    @Autowired
    private ImagesService imageService;

    @DeleteMapping("{id}")
    public ResponseEntity<ApiResponse> deleteImgs(@PathVariable("id") String id) {
        return ResponseEntity.ok(imageService.deleteImgs(id));
    }

    @GetMapping("{id}")
    public ResponseEntity<ApiResponse> getImagesByIdProduct(@PathVariable("id") String id) {
        return ResponseEntity.ok(imageService.getImagesByIdProduct(id));
    }
}
