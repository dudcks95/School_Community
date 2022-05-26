package com.example.tspringboot4.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity(name = "comment_market")
public class Comment_Market {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long m_cnum;
	private String m_c_content;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date m_c_regdate;
	@ManyToOne
	@JoinColumn(name = "m_bnum")
	private Board_Market board_market;
	@ManyToOne
	@JoinColumn(name = "user_no")
	private User user;
	
}
