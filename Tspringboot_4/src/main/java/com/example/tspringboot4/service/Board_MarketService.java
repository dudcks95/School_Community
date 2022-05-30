package com.example.tspringboot4.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.tspringboot4.model.Board_Market;
import com.example.tspringboot4.repository.Board_MarketRepository;

@Service
public class Board_MarketService {
	@Autowired
	private Board_MarketRepository board_MarketRepository;

	// 장터게시판 입력
	public void marketInsert(Board_Market mboard, String uploadFolder) {
		UUID uuid = UUID.randomUUID();
		MultipartFile f = mboard.getUpload(); // 업로드할 이미지 파일
		String uploadFileName = "";
		if (!f.isEmpty()) { // 파일 선택창이 안비었을 때
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				f.transferTo(saveFile); // 이미지 파일을 폴더에 저장
				mboard.setM_pimage(uploadFileName); // db에 이름 저장

				board_MarketRepository.save(mboard);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		board_MarketRepository.save(mboard);
	}

	// 장터게시판 리스트
	public Page<Board_Market> marketList(String field, String word, Pageable pageable) {
		if (field.equals("mpname"))
			return board_MarketRepository.findByMpnameContaining(word, pageable);
		return board_MarketRepository.findAll(pageable);
	}

	// 리스트 수
	public Long count(String field, String word) {
		if (field.equals("mpname"))
			return board_MarketRepository.cntMpnameContaining(word);
		return board_MarketRepository.count();
	}

	// 리스트 조회수 순서
	public List<Board_Market> hitCountList() {
		return board_MarketRepository.findAll(Sort.by(Sort.Direction.DESC, "hitcount"));
	}

	// 장터게시판 상세보기
	@Transactional
	public Board_Market marketDetail(Long mno) {
		Board_Market mboard = board_MarketRepository.findById(mno).get();
		mboard.setHitcount(mboard.getHitcount() + 1);
		return mboard;
	}

	// 장터게시판 수정
	@Transactional
	public void marketUpdate(Board_Market mboard, String uploadFolder) {
		Board_Market m = board_MarketRepository.findById(mboard.getMno()).get();
		UUID uuid = UUID.randomUUID();
		MultipartFile f = mboard.getUpload(); // 업로드할 이미지 파일
		String uploadFileName = "";
		if (!f.isEmpty()) { // 파일 선택창이 안비었을 때
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				f.transferTo(saveFile); // 이미지 파일을 폴더에 저장
				mboard.setM_pimage(uploadFileName); // db에 이름 저장
				m.setM_pimage(mboard.getM_pimage());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		m.setMpname(mboard.getMpname());
		m.setM_pcontent(mboard.getM_pcontent());
		m.setPrice(mboard.getPrice());
	}

	// 장터게시판 삭제
	public void marketDelete(Long mno) {
		board_MarketRepository.deleteById(mno);
	}

}
