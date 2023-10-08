package com.poly.petfoster.service;

import java.util.Date;

import com.poly.petfoster.entity.Pet;
import com.poly.petfoster.response.ApiResponse;

public interface PetService {

    public ApiResponse findById(String petId);

    public Pet findByName(String name);

    public Pet findByCreateAt(Date createAt);

    public Pet findByAge(Double minAge, Double maxAge);

    public ApiResponse selectRecentPet();

}
