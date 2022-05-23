package com.example.tspringboot4.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.repository.BoardRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepositoroy;
	
	//게시글 입력
	public void boardInsert(Board board) {
		boardRepositoroy.save(board);
	}
	
	//게시글 전체보기
	public List<Board> findAll(){
		return boardRepositoroy.findAll();
	}
	
	//게시글 삭제
	@Transactional
	public void boardDelete(Long no) {
		boardRepositoroy.deleteById(no);
	}
	
	//게시글 수정
	@Transactional
	public void boardUpdate(Board board) {
		Board b = boardRepositoroy.findById(board.getNo()).get();
		b.setTitle(board.getTitle());
		b.setContent(board.getContent());
		b.setImage(board.getImage());
	}
	
	//게시글 상세보기
	@Transactional
	public Board boardDetail(Long no) {
		Board board = boardRepositoroy.findById(no).get();
		board.setHitcount(board.getHitcount()+1);
		return board;
	}
	//
	
	
	
}
