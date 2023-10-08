package com.poly.petfoster.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.petfoster.entity.Pet;
import com.poly.petfoster.repository.PetRepositoty;
import com.poly.petfoster.response.ApiResponse;
<<<<<<< Updated upstream
import com.poly.petfoster.response.homepage.ApiHomePage;
=======
>>>>>>> Stashed changes
import com.poly.petfoster.response.homepage.PetResponse;
import com.poly.petfoster.service.PetService;

@Service
public class PetServiceImpl implements PetService {

    @Autowired
    PetRepositoty petRepositoty;

<<<<<<< Updated upstream
=======
    @Override
    public ApiResponse findById(String petId) {

        Pet p = petRepositoty.findByPetId(petId);

        PetResponse petResponse = new PetResponse();

        petResponse.setId(petId);
        petResponse.setName(p.getPetName());
        petResponse.setBreed(p.getPetBreed().getBreedName().toString());
        petResponse.setImage(p.getImgs().get(0).getNameImg());
        petResponse.setDescription(p.getDescriptions());
        petResponse.setFostered(p.getFosterAt());
        petResponse.setSize(p.getAge());
        petResponse.setSex(p.getSex());
        petResponse.setColor(p.getPetColor());
        petResponse.setSterilizated(p.getIsSpay());
        petResponse.setVaccinated(p.getVaccination());
        petResponse.setFosterDate((int) (new Date().getTime() -
                p.getFosterAt().getTime()) / (24 * 3600 * 1000));
        List<String> imgs = new ArrayList<>();

        p.getImgs().forEach(img -> {
            imgs.add(img.getNameImg());
        });

        petResponse.setImgs(imgs);
        petResponse.setLikes(p.getLikes());
        petResponse.setType(p.getPetBreed().getPetType().getName().toString());

        return ApiResponse.builder().message("Successfully!").status(200).errors(false)
                .data(petResponse).build();
    }
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
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
=======
    public ApiResponse selectRecentPet() {
        return ApiResponse.builder().message("Successfully!").status(200).errors(false)
                .data(petRepositoty.selectRecentPet()).build();
>>>>>>> Stashed changes
    }
}
