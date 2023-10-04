package com.poly.petfoster.response.homepage;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class PetResponse {
    
    private String id;
    private String breed;
    private String name;
    private String image;
    private String description;
    private Date fostered;
    private String size;
    private Boolean sex;
    private String type;
    private Integer fosterDate;
    private Boolean like;

}
