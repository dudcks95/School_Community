package com.example.tspringboot4.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tspringboot4.model.Board;

public interface BoardRepository extends JpaRepository<Board, Long>{

}
