package com.example.tspringboot4.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.Board_Market;
import com.example.tspringboot4.model.Comment_Market;
import com.example.tspringboot4.repository.Board_MarketRepository;
import com.example.tspringboot4.repository.Comment_MarketRepository;

//마켓 댓글
@Service
public class Comment_MarketService {
	@Autowired
	private Comment_MarketRepository comment_MarketRepository;
	@Autowired
	private Board_MarketRepository board_MarketRepository;
	
	//댓글 입력
	@Transactional
	public void mcommentInsert(Comment_Market mcomment) {
		Board_Market bm=board_MarketRepository.findById(mcomment.getBoard_market().getMno()).get();
		comment_MarketRepository.mcommentInsert(
				mcomment.getM_c_content(), 
				mcomment.getBoard_market().getMno(), 
				mcomment.getUser().getUserNo());
	}
	
	//댓글 삭제
	public void mcommentDelete(Long mno) {
		comment_MarketRepository.deleteById(mno);
	}
	
	//댓글 리스트
	@Transactional
	public List<Comment_Market> mcommentList(Long mno){
		return comment_MarketRepository.findByBnum(mno);
	}
}
