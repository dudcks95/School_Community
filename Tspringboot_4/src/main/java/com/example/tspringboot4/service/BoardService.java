package com.example.tspringboot4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.model.User;
import com.example.tspringboot4.repository.BoardRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepositoroy;
	
	//게시글 입력
	public void boardInsert(Board board, User user) {
		board.setUser(user);
		boardRepositoroy.save(board);
	}
	
	//게시글 전체보기
	public List<Board> findAll(){
		return boardRepositoroy.findAll();
	}
	
	//게시글 삭제
	
	//게시글 수정
	
	//게시글 상세보기
	
	//
	
	
	
}
