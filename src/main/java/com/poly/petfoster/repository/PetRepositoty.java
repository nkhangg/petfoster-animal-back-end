package com.poly.petfoster.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.petfoster.entity.Pet;

public interface PetRepositoty extends JpaRepository<Pet, String> {
    
}
