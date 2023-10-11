package com.poly.petfoster.response.homepage;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PetResponse {
    private String id;
    private String breed;
    private String name;
    private String image;
    private String description;
    private Date fostered;
    private String size;
    private String sex;
    private String type;
    private Integer fosterDate;
    private Boolean likes;
    private String color;
    private Boolean sterilizated;
    private Boolean vaccinated;
    private List<String> imgs;
}
