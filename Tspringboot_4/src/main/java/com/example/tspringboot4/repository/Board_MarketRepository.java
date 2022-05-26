package com.example.tspringboot4.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.tspringboot4.model.Board_Market;

public interface Board_MarketRepository extends JpaRepository<Board_Market, Long>{
	//public List<Board_Market> findAllByOrderByM_hitcountDesc();
}
