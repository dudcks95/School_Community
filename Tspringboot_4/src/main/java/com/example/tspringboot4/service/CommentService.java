package com.example.tspringboot4.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.model.Comment;
import com.example.tspringboot4.repository.BoardRepository;
import com.example.tspringboot4.repository.CommentRepository;

@Service
public class CommentService {
	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private BoardRepository boardRepository;
	
	//댓글추가
	@Transactional
	public void insert(Comment comment) {
		Board b=boardRepository.findById(comment.getBoard().getNo()).get();
		b.setReplycnt(b.getReplycnt()+1);
		commentRepository.commentInsert(
				comment.getC_content(),
				comment.getBoard().getNo(),
				comment.getUser().getUserNo());
	}
	
	//리스트
	public List<Comment> list(Long no){
		return commentRepository.findByNo(no);
	}
	
	//댓글삭제
	@Transactional
	public void delete(Long no) {
		commentRepository.deleteById(no);
	}
}
