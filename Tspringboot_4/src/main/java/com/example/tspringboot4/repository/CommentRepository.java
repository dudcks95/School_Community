package com.example.tspringboot4.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tspringboot4.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long>{

}
