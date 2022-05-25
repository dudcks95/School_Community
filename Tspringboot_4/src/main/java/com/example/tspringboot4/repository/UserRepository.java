package com.example.tspringboot4.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.data.repository.query.Param;

import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.model.School;
import com.example.tspringboot4.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	Page<User> findByNameContaining(String name, Pageable pageable);
	Page<User> findByUsernameContaining(String username, Pageable pageable);
	
	@Query(value = "select count(*) from user where name like CONCAT('%',:word,'%')", nativeQuery = true)
	public Long cntNameContaining(@Param("word") String word);
	@Query(value = "select count(*) from user where username like CONCAT('%',:word,'%')", nativeQuery = true)
	public Long cntUsernameContaining(@Param("word") String word);
	
	User findByUsername(String username);
	
	

}
