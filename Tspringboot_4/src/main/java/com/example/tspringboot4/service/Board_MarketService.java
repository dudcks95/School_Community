package com.example.tspringboot4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.repository.Board_MarketRepository;

@Service
public class Board_MarketService {
	@Autowired
	private Board_MarketRepository board_MarketRepository;
}
