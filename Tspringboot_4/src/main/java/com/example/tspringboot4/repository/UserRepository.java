package com.example.tspringboot4.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;

import com.example.tspringboot4.model.User;



public interface UserRepository extends JpaRepository<User, Long>{
	Page<User> findByUsernameContaining(String username, Pageable pageable);
	User findByUsername(String username);
}
