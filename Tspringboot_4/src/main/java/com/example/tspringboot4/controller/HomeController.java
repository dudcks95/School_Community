package com.example.tspringboot4.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.model.Board_Market;
import com.example.tspringboot4.model.Comment;
import com.example.tspringboot4.model.School;
import com.example.tspringboot4.repository.BoardRepository;
import com.example.tspringboot4.repository.SchoolRepository;
import com.example.tspringboot4.service.BoardService;
import com.example.tspringboot4.service.UserService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.example.tspringboot4.model.User;
import com.example.tspringboot4.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final UserService userService;
	private final SchoolRepository schoolRepository;
	private final UserRepository userRepository;
	private final BoardService boardService;
	private final BoardRepository boardRepository;
	
	
	@GetMapping("/")
	public String home(Model model) {
		
		model.addAttribute("usercount", userRepository.count());
		model.addAttribute("boardcount", boardRepository.count());
		model.addAttribute("schoolcount", schoolRepository.count());
		return "home";
	}

	@GetMapping("/api")
	@ResponseBody
	public String api() {
		String result = "";
		try {
			URL url = new URL(
					"https://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=81d21d01fed4bedbd4e331e41a333a93&svcType=api&svcCode=SCHOOL&contentType=json&gubun=univ_list&region=100267&sch1=100323&sch2=100328");
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");

			BufferedReader br = null;
			int responseCode = urlconnection.getResponseCode(); // ??????, ????????? ???????????? ??????
			if (responseCode == 200) { // ????????? 200 ???????????? ????????????.
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			}

			String line;
			while ((line = br.readLine()) != null) { // readLine??? ?????? BufferedReader??? ?????? ????????? ????????????
				result = result + line + "\n";
			}

			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode jsonNode = objectMapper.readTree(result);
			List<School> schools = new ArrayList<>(); // school ????????? ??????????????? schools ?????????
			for (JsonNode node : jsonNode.get("dataSearch").get("content")) {
				// node??? jsonNode??? dataSearch?????? content????????? ?????? ?????? ????????????
				// school????????? node??? ?????? setter??? ???????????????
				// school??? ?????? schools??? add????????????.
				School school = new School();
				school.setSchoolName(node.get("schoolName").asText());
				school.setAdres(node.get("link").asText());
				schools.add(school);
			}
			schoolRepository.saveAll(schools);

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// ?????????
	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error) {
		return "/user/login";
	}

	@PostMapping("/login")
	public String login() {
		return "/user/login";
	}

	// ????????? ????????????
	@GetMapping("/idCheck")
	public String idCheck() {
		return "/user/idCheck";
	}

	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("username") String username) {
		return userService.idCheck(username);
	}

	// ????????????
	@GetMapping("join")
	public String join(Model model) {
		model.addAttribute("schools", schoolRepository.findAll());
		return "/user/join";
	}

	@PostMapping("/join")
	@ResponseBody
	public String join(@RequestBody User user) {
		School school = new School();
		school.setSchoolId(user.getSchool().getSchoolId());
		user.setSchool(school);
		if (userRepository.findByUsername(user.getUsername()) != null) {
			return "fail";
		}
		userService.userJoin(user);
		return "success";
	}

	// ?????? ????????? ??????
	@GetMapping("mywrite/{userNo}")
	public String mywrite(@PathVariable Long userNo, Model model,
			@PageableDefault(size = 8, sort = "no", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String field,
			@RequestParam(required = false, defaultValue = "") String word) {
		Page<Board> board = userService.findByUserNo(userNo, field, word, pageable);
		Long count = userService.writeCount(userNo, field, word);
		model.addAttribute("boards", board);
		model.addAttribute("count", count);
		model.addAttribute("rowNo", count - (board.getNumber() * pageable.getPageSize()));
		return "/user/mywrite";
	}

	// ?????? ????????? ?????????
	@GetMapping("mycomment/{userNo}")
	public String mycomment(@PathVariable Long userNo, Model model,
			@PageableDefault(size = 8, sort = "cnum", direction = Direction.DESC) Pageable pageable) {
		Page<Comment> comment = userService.cfindByUserNo(userNo, pageable);
		Long count = userService.commentCount(userNo);
		model.addAttribute("comments", comment);
		model.addAttribute("count", count);
		model.addAttribute("rowNo", count - (comment.getNumber() * pageable.getPageSize()));
		return "/user/mycomment";
	}

	// ?????? ??????
	@GetMapping("mymarket/{userNo}")
	public String mymarket(@PathVariable Long userNo, Model model,
			@PageableDefault(size = 6, sort = "mno", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String field,
			@RequestParam(required = false, defaultValue = "") String word) {
		Page<Board_Market> bm = userService.mfindByUserNo(userNo, field, word, pageable);
		Long count = userService.marketCount(userNo, field, word);
		model.addAttribute("products", bm);
		model.addAttribute("count", count);
		return "/user/mymarket";
	}

	// ?????????????????????
	@GetMapping("myinfo/{userNo}")
	public String myinfo(@PathVariable Long userNo, Model model) {
		model.addAttribute("user", userService.findById(userNo));
		return "/user/myinfo";
	}

	// ????????????
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody User user) {
		userService.userUpdate(user);
		return "success";
	}

	// ????????????
	@DeleteMapping("delete/{userNo}")
	@ResponseBody
	public String delete(@PathVariable Long userNo) {
		userService.userDelete(userNo);
		return "success";
	}

	// ???????????????
	@GetMapping("userlist")
	public String userlist(Model model,
			@PageableDefault(size = 8, sort = "userNo", direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue = "") String field,
			@RequestParam(required = false, defaultValue = "") String word) {
		Page<User> lists = userService.userFindList(field, word, pageable);
		Long count = userService.userCount(field, word);
		model.addAttribute("users", lists);
		model.addAttribute("count", count);
		model.addAttribute("rowNo", count - (lists.getNumber() * pageable.getPageSize()));
		return "/admin/userlist";
	}

	// @GetMapping("contact")
	// public String contact() {
	// return "/user/contact";
	// }
}
