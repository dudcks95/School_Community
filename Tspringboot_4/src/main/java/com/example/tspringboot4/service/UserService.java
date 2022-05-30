package com.example.tspringboot4.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.model.Board_Market;
import com.example.tspringboot4.model.Comment;
import com.example.tspringboot4.model.User;
import com.example.tspringboot4.repository.BoardRepository;
import com.example.tspringboot4.repository.Board_MarketRepository;
import com.example.tspringboot4.repository.CommentRepository;
import com.example.tspringboot4.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private BoardRepository boardRepository;
	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private Board_MarketRepository bmRepository;
	@Autowired
	private BCryptPasswordEncoder encoder;
	private String flag = "yes";

	// 회원가입
	public void userJoin(User user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole("ROLE_USER");
		userRepository.save(user);

	}

	// 회원 리스트(페이징, 검색 포함, 관리자 전용)
	public Page<User> userFindList(String field, String word, Pageable pageable) {
		if (field.equals("name"))
			return userRepository.findByNameContaining(word, pageable);
		if (field.equals("username"))
			return userRepository.findByUsernameContaining(word, pageable);
		return userRepository.findAll(pageable);
	}

	// 내가작성한글
	public Page<Board> findByUserNo(Long userNo, String field, String word, Pageable pageable) {
		if (field.equals("title"))
			return boardRepository.findByUserNoContaing(userNo, word, pageable);
		return boardRepository.findByUserNo(userNo, pageable);
	}

	// 내가작성한 글 수
	public Long writeCount(Long userNo, String field, String word) {
		if (field.equals("title"))
			return boardRepository.cntUserNoContaing(userNo, word);
		return boardRepository.findByUserNo(userNo);
	}

	// 내가 작성한 댓글
	public Page<Comment> cfindByUserNo(Long userNo, Pageable pageable) {
		return commentRepository.findByUserNo(userNo, pageable); 
	}

	// 내가작성한 댓글 수
	public Long commentCount(Long userNo) {
		return commentRepository.findByUserNo(userNo);
	}

	// 나의 장터
	public Page<Board_Market> mfindByUserNo(Long userNo, String field, String word, Pageable pageable) {
		if (field.equals("mpname"))
			return bmRepository.mfindByUserNoContaing(userNo, word, pageable);
		return bmRepository.findByUserNo(userNo, pageable);
	}

	// 나의 장터 수
	public Long marketCount(Long userNo, String field, String word) {
		if (field.equals("mpname"))
			return bmRepository.mcntUserNoContaing(userNo, word);
		return bmRepository.cfindByUserNo(userNo);
	}

	// 아이디중복확인
	public String idCheck(String username) {
		// System.out.println(username);
		User user = userRepository.findByUsername(username);
		if (user == null) {
			return "yes";
		}
		return "no";
	}

	// 회원 수 (검색 전, 후)
	public Long userCount(String field, String word) {
		if (field.equals("name"))
			return userRepository.cntNameContaining(word);
		if (field.equals("username"))
			return userRepository.cntUsernameContaining(word);
		return userRepository.count();
	}

	// 회원 정보 수정
	@Transactional
	public void userUpdate(User user) {
		User u = userRepository.findById(user.getUserNo()).get();
		u.setName(user.getName());
		u.setUsername(user.getUsername());
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		u.setPassword(encPassword);
		u.setEmail(user.getEmail());
		u.setPhone(user.getPhone());
		//u.setSchool(user.getSchool());
		u.setSchoolgrade(user.getSchoolgrade());
	}

	// 회원 정보 삭제
	@Transactional
	public void userDelete(Long userNo) {
		userRepository.deleteById(userNo);
	}

	// 회원 정보 상세보기
	public User findById(Long userNo) {
		User user = userRepository.findById(userNo).get();
		return user;
	}

}
