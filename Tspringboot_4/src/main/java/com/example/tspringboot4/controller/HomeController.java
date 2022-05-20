package com.example.tspringboot4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.tspringboot4.model.School;
import com.example.tspringboot4.model.User;
import com.example.tspringboot4.repository.UserRepository;
import com.example.tspringboot4.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final UserService userService;
	private final UserRepository userRepository;
	
	@GetMapping("/")
	public String home() {
		return "quote";
	}
	//로그인
	@GetMapping("/login")
	public String login(@RequestParam(value="error", required = false) String error) {
		return "/user/login";
	}
	  @PostMapping("/login")
	  public String login() {
		  return "/user/login";
	  }
//	@GetMapping("/login/error")
//	public String login(Model model) {
//		model.addAttribute("errorMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
//		return "/user/login";
//	}
	//아이디 중복확인
	@GetMapping("/idCheck")
	public String idCheck() {
		return "/user/idCheck";
	}
	
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("username")String username) {
		return userService.idCheck(username);
	}
	
	//회원가입
	@GetMapping("join")
	public String join() {
		return "/user/join";
	}
	@PostMapping("/join")
	@ResponseBody
	public String join(@RequestBody User user) {
		School school=new School();
		school.setSchoolname(user.getSchool().getSchoolname());
		user.setSchool(school);
		if(userRepository.findByUsername(user.getUsername())!=null) {
			return "fail";
		}
		userService.userJoin(user);
		return "success";
	}
	
	//내가 작성한 글폼
	@GetMapping("mywrite")
	public String mywrite() {
		return "/user/mywrite";
	}
	//내가 작성한 댓글폼
	@GetMapping("mycomment")
	public String mycomment() {
		return "/user/mycomment";
	}
	//회원정보수정
	@GetMapping("myinfo/{no}")
	public String mypage(@PathVariable Long no, Model model) {
		model.addAttribute("user", userService.findById(no));
		return "/user/myinfo";
	}
	//회원탈퇴
	
	//회원수정
	
}