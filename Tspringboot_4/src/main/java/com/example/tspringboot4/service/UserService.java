package com.example.tspringboot4.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.User;
import com.example.tspringboot4.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private BCryptPasswordEncoder encoder;
	private String flag="yes";
	
	//회원가입
	public void userJoin(User user) {
		String rawPassword=user.getPassword();
		String encPassword=encoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRole("ROLE_USER");
		userRepository.save(user);
	}
	//아이디중복확인
	public String idCheck(String username) {
		System.out.println(username);
		User user= userRepository.findByUsername(username);
		if(user==null) {
			return "yes";
		}
		return "no";
	}
	
	//회원 리스트(페이징, 검색 포함, 관리자 전용)
	public Page<User> userFindList(String field, String word, Pageable pageable){
		return null;
	}
	
	//회원 수 (검색 전, 후)
	public Long userCount(String field, String word) {
		return null;
	}
	
	//회원 정보 수정
	public void userUpdate(User user) {
		
	}
	
	//회원 정보 삭제
	public void userDelete(Long no) {
		
	}
	
	//회원 정보 상세보기
	public User findById(Long no) {
		return null;
	}
}
