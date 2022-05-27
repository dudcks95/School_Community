package com.example.tspringboot4.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import com.example.tspringboot4.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long>{
	//댓글추가
	@Modifying
	@Query(value = "insert into comment(c_content,c_regdate,bnum,user_no) values(?1,now(),?2,?3)", nativeQuery = true)
	public void commentInsert(String c_content, Long bnum, Long userNo);	
	//리스트 JPQL
	@Query("select sc from comment sc where bnum=?1")
	public List<Comment> findByNo(Long no);	
	
	//내가 작성한 댓글
	@Query("select sc from comment sc where user_no=?1")
	public Page<Comment> findByUserNo(Long userNo,Pageable pageable);
	//내가 작성한 댓글 수
	@Query(value = "select count(*) from comment where user_no=?1", nativeQuery = true)
	public Long findByUserNo(Long no);
}
