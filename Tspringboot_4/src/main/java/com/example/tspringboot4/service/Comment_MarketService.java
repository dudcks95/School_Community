package com.example.tspringboot4.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.Comment_Market;
import com.example.tspringboot4.repository.Comment_MarketRepository;

//마켓 댓글
@Service
public class Comment_MarketService {
	@Autowired
	private Comment_MarketRepository comment_MarketRepository;
	
	//댓글 입력
	public void mcommentInsert(Comment_Market mcomment) {
		comment_MarketRepository.save(mcomment);
	}
	
	//댓글 삭제
	public void mcommentDelete(Long m_cnum) {
		comment_MarketRepository.deleteById(m_cnum);
	}
	
	//댓글 리스트
	public List<Comment_Market> mcommentList(Long m_bnum){
		return comment_MarketRepository.findByBnum(m_bnum);
	}
}
