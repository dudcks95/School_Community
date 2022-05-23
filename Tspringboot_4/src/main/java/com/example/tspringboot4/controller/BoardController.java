package com.example.tspringboot4.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.tspringboot4.config.auth.PrincipalDetails;
import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@GetMapping("boardList")
	public String list(Model model) {
		model.addAttribute("boards", boardService.findAll());
		return "/board/boardList";
	}

	// 게시판 입력 폼
	@GetMapping("boardInsert")
	public String insert() {
		return "/board/boardInsert";
	}

	@PostMapping("boardInsert")
	public String insert(Board board,
			@AuthenticationPrincipal PrincipalDetails principal) {
		boardService.boardInsert(board, principal.getUser());
		return "redirect:/boardList";
	}

}
