package com.example.tspringboot4.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.tspringboot4.model.User;



public interface UserRepository extends JpaRepository<User, Long>{
	User findByUsername(String username);
	
	//@Query(value =  "select * from user where userid=:username", nativeQuery = true)
	//public User existsByUserid(String username);
}
