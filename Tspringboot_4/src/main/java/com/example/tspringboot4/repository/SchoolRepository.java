package com.example.tspringboot4.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tspringboot4.model.School;

public interface SchoolRepository extends JpaRepository<School, Long>{

}
