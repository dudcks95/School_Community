package com.example.tspringboot4.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.tspringboot4.model.Comment_Market;

public interface Comment_MarketRepository extends JpaRepository<Comment_Market, Long>{
	//댓글추가
	@Modifying
	@Query(value="insert into comment_market(m_c_content,m_c_regdate,m_bnum,user_no) values(?1,now(),?2,?3)",nativeQuery = true)
	public void mcommentInsert(String m_c_content, Long m_bnum, Long userNo);
	//리스트
	@Query("select cm from comment_market cm where m_bnum=?1")
	public List<Comment_Market> findByBnum(Long mno);
}
