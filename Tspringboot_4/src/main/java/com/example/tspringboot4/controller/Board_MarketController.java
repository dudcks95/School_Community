package com.example.tspringboot4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.tspringboot4.model.Board_Market;
import com.example.tspringboot4.service.Board_MarketService;

@Controller
public class Board_MarketController {
	@Autowired
	private Board_MarketService board_MarketService;
	
	//장터 게시판 입력 폼
	@GetMapping("marketInsert")
	public String marketInsert(Board_Market mboard) {
		return "/board_market/marketInsert";
	}
}
