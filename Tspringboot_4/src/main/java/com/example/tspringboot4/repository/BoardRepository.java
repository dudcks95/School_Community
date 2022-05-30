package com.example.tspringboot4.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.tspringboot4.model.Board;

public interface BoardRepository extends JpaRepository<Board, Long>{
	//이름검색
	Page<Board> findByWriterContainingAndSort(String writer, Pageable pageable, String sort);
	//Page<Board> findByWriterContainingAndSortAndSchoolName(String writer, Pageable pageable, String sort, String schoolName);
	//제목 검색
	Page<Board> findByTitleContainingAndSort(String title, Pageable pageable, String sort);
	//Page<Board> findByTitleContainingAndSortAndSchoolName(String title, Pageable pageable, String sort, String schoolName);
	
	Page<Board> findBySort(Pageable pageable, String sort);
	//Page<Board> findBySort(Pageable pageable, String sort, String schoolName);
	//이름검색
		Page<Board> findByWriterContaining(String writer, Pageable pageable);
		//제목 검색
		Page<Board> findByTitleContaining(String title, Pageable pageable);
		
		
	//이름검색 수
	@Query(value = "select count(*) from board where writer like CONCAT('%',:word,'%')",nativeQuery = true)
	public Long cntWriterContaining(@Param("word") String word);
	//제목 검색수
	@Query(value = "select count(*) from board where title like CONCAT('%',:word,'%')",nativeQuery = true)
	public Long cntTitleContaining(@Param("word") String word);
	
	
	//내가 작성한 글 검색 JPQL
	@Query(value="select * from board where user_no=:userNo and title like CONCAT('%',:word,'%')",nativeQuery = true)
	public Page<Board> findByUserNoContaing(@Param("userNo") Long userNo, @Param("word") String word, Pageable pageable);
	//내가 작성한 글 수 JPQL
	@Query(value="select count(*) from board where user_no=:userNo and title like CONCAT('%',:word,'%')",nativeQuery = true)
	public Long cntUserNoContaing(@Param("userNo") Long userNo, @Param("word") String word);
	
	//내가 작성한 글 JPQL
	@Query("select sc from board sc where user_no=?1")
	public Page<Board> findByUserNo(Long userNo, Pageable pageable);
	//내가 작성한 글 수
	@Query(value = "select count(*) from board where user_no=?1", nativeQuery = true)
	public Long findByUserNo(Long userNo);
}
