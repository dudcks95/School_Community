package com.example.tspringboot4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.tspringboot4.service.BoardService;

@RequestMapping("/board/*")
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("insert")
	public String write() {
		return "/board/insert";
	}
}
