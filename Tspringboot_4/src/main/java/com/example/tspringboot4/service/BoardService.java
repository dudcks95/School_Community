package com.example.tspringboot4.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.model.School;
import com.example.tspringboot4.model.User;
import com.example.tspringboot4.repository.BoardRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepositoroy;

	// 게시글 입력
	public void boardInsert(Board board, User user) {
		board.setUser(user);
		// board.setSchool(school);
		boardRepositoroy.save(board);
	}

	// 게시글 전체보기
	public Page<Board> findAll(String field, String word, Pageable pageable, String sort) {
		if (field.equals("writer"))
			return boardRepositoroy.findByWriterContainingAndSort(word, pageable, sort);
		if (field.equals("title"))
			return boardRepositoroy.findByTitleContainingAndSort(word, pageable, sort);
		return boardRepositoroy.findBySort(pageable, sort);
	}

	// 게시글 전체보기(학교분류 시도)
//	public Page<Board> findAll(String field, String word, Pageable pageable, String sort, String schoolName) {
//		if (field.equals("writer"))
//			return boardRepositoroy.findByWriterContainingAndSort(word, pageable, sort);
//		if (field.equals("title"))
//			return boardRepositoroy.findByTitleContainingAndSort(word, pageable, sort);
//		return boardRepositoroy.findBySort(pageable, sort, schoolName);
//	}

	// 게시글 전체보기2
	public Page<Board> findAll2(String field, String word, Pageable pageable) {
		if (field.equals("writer"))
			return boardRepositoroy.findByWriterContaining(word, pageable);
		if (field.equals("title"))
			return boardRepositoroy.findByTitleContaining(word, pageable);
		return boardRepositoroy.findAll(pageable);
	}

	// 게시글 수
	public Long boardCount(String field, String word) {
		if (field.equals("writer"))
			return boardRepositoroy.cntWriterContaining(word);
		if (field.equals("title"))
			return boardRepositoroy.cntTitleContaining(word);
		return boardRepositoroy.count();
	}

	// 게시글 삭제
	@Transactional
	public void boardDelete(Long no) {
		boardRepositoroy.deleteById(no);
	}

	// 게시글 수정
	@Transactional
	public void boardUpdate(Board board) {
		Board b = boardRepositoroy.findById(board.getNo()).get();
		b.setTitle(board.getTitle());
		b.setContent(board.getContent());
		b.setImage(board.getImage());
	}

	// 게시글 상세보기
	@Transactional
	public Board boardDetail(Long no) {
		Board board = boardRepositoroy.findById(no).get();
		board.setHitcount(board.getHitcount() + 1);
		return board;
	}

	// 관리자용 게시글
	public Page<Board> adfindAll(String field, String word, Pageable pageable) {
		if (field.equals("writer"))
			return boardRepositoroy.findByWriterContaining(word, pageable);
		if (field.equals("title"))
			return boardRepositoroy.findByTitleContaining(word, pageable);
		return boardRepositoroy.findAll(pageable);
	}

	// 관리자용 게시글
	public Page<Board> adfindAll(Pageable pageable) {
		/*
		 * if (field.equals("writer")) return
		 * boardRepositoroy.findByWriterContaining(word, pageable); if
		 * (field.equals("title")) return boardRepositoroy.findByTitleContaining(word,
		 * pageable);
		 */
		return boardRepositoroy.findAll(pageable);
	}

	// 관리자용 게시글수
	public Long adCount() {
		return boardRepositoroy.count();
	}
}
