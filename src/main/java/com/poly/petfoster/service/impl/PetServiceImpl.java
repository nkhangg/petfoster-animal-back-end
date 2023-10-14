package com.poly.petfoster.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.Pet;
import com.poly.petfoster.repository.PetRespository;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.response.homepage.ApiHomePage;
import com.poly.petfoster.response.homepage.PetResponse;
import com.poly.petfoster.service.PetService;

@Service
public class PetServiceImpl implements PetService {

    @Autowired
    PetRespository petRespository;


    @Override
    public ApiResponse selectRecentPet() {

        List<PetResponse> pets = new ArrayList<>();


        petRespository.selectRecentPet().stream().forEach(pet -> {
            pets.add(PetResponse.builder()
            .id(pet.getPetId())
            .breed(pet.getPetBreed().getBreedName())
            .description(pet.getDescriptions())
            .name(pet.getPetName())
            .image("https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQkrjYxSfSHeCEA7hkPy8e2JphDsfFHZVKqx-3t37E4XKr-AT7DML8IwtwY0TnZsUcQ")
            .type("dog")
            .fosterDate(300)
            .fostered(pet.getFosterAt())
            .sex(pet.getSex() ? "Male" : "Female")
            .size(pet.getAge())
            .like(false)
            .build());

        });

        return ApiResponse.builder()
            .message("Successfully!")
            .status(200)
            .errors(false)
            .data(ApiHomePage.builder().pets(pets).build())
            .build();
    }


    @Override
    public Pet findByAge(Double minAge, Double maxAge) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public Pet findByCreateAt(Date createAt) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public Pet findById(String petId) {
        // TODO Auto-generated method stub
        return null;
    }


    @Override
    public Pet findByName(String name) {
        // TODO Auto-generated method stub
        return null;
    }
}
