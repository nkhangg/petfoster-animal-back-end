package com.poly.petfoster.repository;

import com.poly.petfoster.response.UserProfile;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserProfileRepository extends JpaRepository<UserProfile, String>{
    Optional<UserProfile> findByUsername(String username);
}
