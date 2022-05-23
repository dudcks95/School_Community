package com.example.tspringboot4.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.User;
import com.example.tspringboot4.repository.UserRepository;

import ch.qos.logback.core.encoder.Encoder;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
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
	public Page<User> userFindList(String name, Pageable pageable){
		Page<User> lists = userRepository.findAll(pageable);
		lists = userRepository.findByUsernameContaining(name,pageable);
		return lists;
		
	//아이디중복확인
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
		return userRepository.count();
	}

	// 회원 정보 수정
	@Transactional
	public void userUpdate(User user) {
		User u = userRepository.findById(user.getNo()).get();
		u.setName(user.getName());
		u.setUsername(user.getUsername());
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		u.setPassword(encPassword);
		u.setEmail(user.getEmail());
		u.setPhone(user.getPhone());
		u.setSchool(user.getSchool());
		u.setSchoolgrade(user.getSchoolgrade());
	}

	// 회원 정보 삭제
	@Transactional
	public void userDelete(Long no) {
		userRepository.deleteById(no);
	}

	// 회원 정보 상세보기
	@Transactional
	public User findById(Long no) {
		User user = userRepository.findById(no).get();
		return user;
	}
}
