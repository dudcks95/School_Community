package com.example.tspringboot4.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.tspringboot4.config.auth.PrincipalDetails;
import com.example.tspringboot4.model.Board_Market;
import com.example.tspringboot4.model.User;
import com.example.tspringboot4.service.Board_MarketService;

@Controller
public class Board_MarketController {
	@Autowired
	private Board_MarketService board_MarketService;

	// 장터 게시판 입력 폼
	@GetMapping("marketInsert")
	public String marketInsert() {
		return "/board_market/marketInsert";
	}

	// 장터게시판 입력
	@PostMapping("marketInsert")
	public String marketInsert(Board_Market mboard, @AuthenticationPrincipal PrincipalDetails prin, HttpSession session) {
		// System.out.println("result:"+principal.getNo());
		// Authentication auth =SecurityContextHolder.getContext().getAuthentication();
		// //1번 방법 : 제일 귀찮음
		// PrincipalDetails prin =(PrincipalDetails)auth.getPrincipal();
		// 2번 방법 : 위에 SecurityContextHolder를 가져오는 과정을 생략, 객체 인자값에 Authentication을 추가해줘야함
		// 3번 방법 : @AuthenticationPrincipal을 이용한 principal객체를 바로 사용

		System.out.println(prin.getNo());

		User user = new User();
		user.setUserNo(prin.getNo());
		mboard.setUser(user);
		String uploadFolder = session.getServletContext().getRealPath("/") + "\\resources\\img";
		board_MarketService.marketInsert(mboard, uploadFolder);
		return "redirect:/marketList"; // redirect를 사용해야 insert폼에서 맴돌지않음
	}

	// 장터게시판 리스트 출력
	@GetMapping("marketList")
	public String marketList(Model model,
			@PageableDefault(size = 6, sort = "mno", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String field,
			@RequestParam(required = false, defaultValue = "") String word) {
		model.addAttribute("count", board_MarketService.count(field, word));
		model.addAttribute("products", board_MarketService.marketList(field, word, pageable));
		model.addAttribute("hits", board_MarketService.hitCountList());
		return "/board_market/marketList";
	}

	// 장터게시판 게시글 상세보기
	@GetMapping("marketDetail/{mno}")
	public String marketDetail(@PathVariable Long mno, Model model) {
		model.addAttribute("product", board_MarketService.marketDetail(mno));
		return "/board_market/marketDetail";
	}

	// 장터게시판 게시글 삭제하기
	@DeleteMapping("marketDelete/{mno}")
	@ResponseBody
	public String marketDelete(@PathVariable Long mno) {
		board_MarketService.marketDelete(mno);
		return "success";
	}

	// 장터게시판 게시글 수정 폼
	@GetMapping("marketUpdate/{mno}")
	public String marketUpdate(@PathVariable Long mno, Model model) {
		model.addAttribute("product", board_MarketService.marketDetail(mno));
		return "/board_market/marketUpdate";
	}

	// 장터게시판 게시글 수정하기
	@PostMapping("marketUpdate")
	@ResponseBody
	public String marketUpdate(Board_Market mboard, HttpSession session) {
		String uploadFolder = session.getServletContext().getRealPath("/") + "\\resources\\img";
		board_MarketService.marketUpdate(mboard, uploadFolder);
		return "success";
	}

	// 관리자용 장터
	@GetMapping("admarket")
	public String admarket(Model model,
			@PageableDefault(size = 6, sort = "mno", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String field,
			@RequestParam(required = false, defaultValue = "") String word) {
		model.addAttribute("count", board_MarketService.count(field, word));
		model.addAttribute("products", board_MarketService.marketList(field, word, pageable));
		return "/admin/admarket";
	}

}
