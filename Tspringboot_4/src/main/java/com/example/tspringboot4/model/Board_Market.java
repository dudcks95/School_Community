package com.example.tspringboot4.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity(name = "board_market")
public class Board_Market {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long mno;
	private String m_pname;
	private String m_writer;
	private String m_pcontent;
	private Long price;
	private String m_pimage;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date m_regdate;
	
	@ManyToOne
	@JoinColumn(name = "user_no")
	private User user;
}
