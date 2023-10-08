package com.poly.petfoster.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.Pet;
import com.poly.petfoster.repository.PetRespository;
import com.poly.petfoster.response.ApiResponse;
import com.poly.petfoster.service.PetService;

@Service
public class PetServiceImpl implements PetService {

    @Autowired
    PetRespository petRespository;

    @Override
    public Pet findById(String petId) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findById'");
    }

    @Override
    public Pet findByName(String name) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByName'");
    }

    @Override
    public Pet findByCreateAt(Date createAt) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByCreateAt'");
    }

    @Override
    public Pet findByAge(Double minAge, Double maxAge) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'findByAge'");
    }

    @Override
    public ApiResponse selectRecentPet() {
        return ApiResponse.builder().message("Successfully!").status(200).errors(false)
                .data(petRespository.selectRecentPet()).build();
    }
}
