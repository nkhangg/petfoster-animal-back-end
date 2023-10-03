package com.poly.petfoster.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class ProductType {
    
    @Id
    @Column(name = "product_type_id")
    private String id;

    @Column(name = "product_type_name")
    private String name;

    @OneToMany(mappedBy = "productType", cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Product> products = new ArrayList<>();
}
