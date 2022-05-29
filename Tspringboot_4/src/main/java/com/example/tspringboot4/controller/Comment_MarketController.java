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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.tspringboot4.config.auth.PrincipalDetails;
import com.example.tspringboot4.model.Board_Market;
import com.example.tspringboot4.model.Comment_Market;
import com.example.tspringboot4.service.Comment_MarketService;

@RequestMapping("/mreply/*")
@RestController
public class Comment_MarketController {
	@Autowired
	private Comment_MarketService mCommentService;
	
	//댓글추가
	@PostMapping("insert/{mno}")
	public ResponseEntity<String> mCommentInsert(@PathVariable Long mno,
			@RequestBody Comment_Market mComment,
			@AuthenticationPrincipal PrincipalDetails principal){
		PrincipalDetails p=(PrincipalDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Board_Market bm=new Board_Market();
		bm.setMno(mno);
		mComment.setBoard_market(bm);
		
		mComment.setUser(p.getUser());
		mCommentService.mcommentInsert(mComment);
		return new ResponseEntity<String>("success",HttpStatus.OK);
		
	}
	
	//댓글리스트
	@GetMapping("list/{mno}")
	public List<Comment_Market> list(@PathVariable Long mno){
		List<Comment_Market> mlist=mCommentService.mcommentList(mno);
		return mlist;
	}
	
	//삭제
	@DeleteMapping("delete/{mno}")
	public Long delete(@PathVariable Long mno) {
		mCommentService.mcommentDelete(mno);
		return mno;
	}

}
