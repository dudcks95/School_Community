package com.example.tspringboot4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.tspringboot4.config.auth.PrincipalDetails;
import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.service.BoardService;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//@RequestMapping("/board/*")
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@GetMapping("boardList/{sort}")
	public String list(Model model, @PathVariable String sort,
			@PageableDefault(size = 8, sort = "no", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String field,
			@RequestParam(required = false, defaultValue = "") String word) {
		Page<Board> board = boardService.findAll(field, word, pageable, sort);
		Long count = boardService.boardCount(field, word);
		model.addAttribute("sort", board.getContent().get(0).getSort());
		model.addAttribute("boards", board);
		model.addAttribute("count", count);
		model.addAttribute("rowNo", count - (board.getNumber() * pageable.getPageSize()));
		return "/board/boardList";
	}
	
//	@GetMapping("boardList/{schoolName}/{sort}")
//	public String list(Model model, @PathVariable String schoolName, @PathVariable String sort,
//			@PageableDefault(size = 8, sort = "no", direction = Direction.DESC) Pageable pageable,
//			@RequestParam(required = false, defaultValue = "") String field,
//			@RequestParam(required = false, defaultValue = "") String word) {
//		Page<Board> board = boardService.findAll(field, word, pageable, sort, schoolName);
//		Long count = boardService.boardCount(field, word);
//		model.addAttribute("sort", board.getContent().get(0).getSort());
//		model.addAttribute("boards", board);
//		model.addAttribute("count", count);
//		model.addAttribute("rowNo", count - (board.getNumber() * pageable.getPageSize()));
//		return "/board/boardList";
//	}

	@GetMapping("boardList")
	public String list(Model model,
			@PageableDefault(size = 8, sort = "no", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String field,
			@RequestParam(required = false, defaultValue = "") String word) {
		Page<Board> board = boardService.findAll2(field, word, pageable);
		Long count = boardService.boardCount(field, word);
		model.addAttribute("boards", board);
		model.addAttribute("count", count);
		model.addAttribute("rowNo", count - (board.getNumber() * pageable.getPageSize()));
		return "/board/boardList";
	}

	// 게시판 입력 폼
	@GetMapping("boardInsert")
	public String insert() {
		return "/board/boardInsert";
	}

	// 게시판 입력
	@PostMapping("boardInsert")
	public String insert(Board board,
			@AuthenticationPrincipal PrincipalDetails principal) {
		boardService.boardInsert(board, principal.getUser());
		return "redirect:/boardList";
	}

	// 게시판 상세보기
	@GetMapping("boardDetail/{no}")
	public String detail(@PathVariable Long no, Model model) {
		model.addAttribute("board", boardService.boardDetail(no));
		return "/board/boardDetail";
	}

	// 게시판 수정 폼
	@GetMapping("boardUpdate/{no}")
	public String update(@PathVariable Long no, Model model) {
		model.addAttribute("board", boardService.boardDetail(no));
		return "/board/boardUpdate";
	}

	// 게시판 수정
	@PutMapping("boardUpdate")
	@ResponseBody
	public String update(@RequestBody Board board) {
		boardService.boardUpdate(board);
		return "success";
	}

	// 게시판 삭제
	@DeleteMapping("boardDelete/{no}")
	@ResponseBody
	public String delete(@PathVariable Long no) {
		boardService.boardDelete(no);
		return "success";
	}

	// 관리자 게시글보기
	@GetMapping("adboard")
	public String adlist(Model model,
			@PageableDefault(size = 8, sort = "no", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String field,
			@RequestParam(required = false, defaultValue = "") String word) {
		Page<Board> board = boardService.findAll2(field, word, pageable);
		Long count = boardService.boardCount(field, word);
		model.addAttribute("boards", board);
		model.addAttribute("count", count);
		model.addAttribute("rowNo", count - (board.getNumber() * pageable.getPageSize()));
		return "/admin/adboard";
	}

	@GetMapping("schedule")
	public String schedule() {
		return "/schedule/schedule";
	}
}
