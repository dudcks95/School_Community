package com.example.tspringboot4.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.tspringboot4.model.Board_Market;

public interface Board_MarketRepository extends JpaRepository<Board_Market, Long> {
	// 장터 제목 검색
	public Page<Board_Market> findByMpnameContaining(String pname, Pageable pageable);

	// 장터 제목 검색 수
	@Query(value = "select count(*) from board_market where mpname like CONCAT('%',:word,'%')", nativeQuery = true)
	public Long cntMpnameContaining(@Param("word") String word);

	// 나의 장터 검색 JPQL
	@Query(value = "select * from board_market where user_no=:userNo and mpname like CONCAT('%',:word,'%')", nativeQuery = true)
	public Page<Board_Market> mfindByUserNoContaing(@Param("userNo") Long userNo, @Param("word") String word,
			Pageable pageable);

	// 나의 장터 수 JPQL
	@Query(value = "select count(*) from board_market where user_no=:userNo and mpname like CONCAT('%',:word,'%')", nativeQuery = true)
	public Long mcntUserNoContaing(@Param("userNo") Long userNo, @Param("word") String word);

	// 나의 장터
	@Query("select sc from board_market sc where user_no=?1")
	public Page<Board_Market> findByUserNo(Long userNo, Pageable pageable);

	// 나의 장터 수
	@Query(value = "select count(*) from board_market where user_no=?1", nativeQuery = true)
	public Long cfindByUserNo(Long userNo);

}
