package com.example.tspringboot4.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.tspringboot4.model.Comment_Market;

public interface Comment_MarketRepository extends JpaRepository<Comment_Market, Long>{
	@Query("select cm from comment_market cm where m_bnum=?1")
	public List<Comment_Market> findByBnum(Long m_bnum);
}