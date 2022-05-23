package com.example.tspringboot4.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.tspringboot4.model.Board_Market;
import com.example.tspringboot4.repository.Board_MarketRepository;

@Service
public class Board_MarketService {
	@Autowired
	private Board_MarketRepository board_MarketRepository;
	
	//장터게시판 입력
	public void marketInsert(Board_Market mboard) {
		board_MarketRepository.save(mboard);
	}
	
	//장터게시판 리스트
	public List<Board_Market> marketList(){
		return board_MarketRepository.findAll();
	}
	
	//장터게시판 상세보기
	public Board_Market marketDetail(Long mno) {
		return board_MarketRepository.findById(mno).get();
	}
	
	//장터게시판 수정
	@Transactional
	public void marketUpdate(Board_Market mboard) {
		Board_Market m = board_MarketRepository.findById(mboard.getMno()).get();
		//m.setM_pname();
	}
	
	//장터게시판 삭제
	public void marketDelete(Long mno) {
		board_MarketRepository.deleteById(mno);
	}
	
}
