package com.example.tspringboot4.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.tspringboot4.config.auth.PrincipalDetails;
import com.example.tspringboot4.model.Board;
import com.example.tspringboot4.model.Comment;
import com.example.tspringboot4.model.User;
import com.example.tspringboot4.service.CommentService;

@RequestMapping("/reply/*")
@RestController
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	//댓글추가
	@PostMapping("insert/{no}")
	public ResponseEntity<String> commentInsert(@PathVariable Long no,
			@RequestBody Comment comment,
			@AuthenticationPrincipal PrincipalDetails principal){
		PrincipalDetails p=(PrincipalDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Board b=new Board();
		b.setNo(no);
		comment.setBoard(b);

		comment.setUser(p.getUser());
		commentService.insert(comment);
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	//리스트
	@GetMapping("list/{no}")
	public List<Comment> list(@PathVariable Long no){
		List<Comment> clist=commentService.list(no);
		return clist;
	}
	
	//삭제
	@DeleteMapping("delete/{no}")
	public Long delete(@PathVariable Long no) {
		commentService.delete(no);
		return no;
	}
	
}
