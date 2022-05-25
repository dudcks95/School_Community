package com.example.tspringboot4.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity(name = "board")
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long no;
	private String title;
	private String writer;
	private String content;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	private Long hitcount;
	private Long replycnt;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_no")
	private User user;
	
	private String image;
	private String school;
	private String sort;
	
	@PrePersist
	public void prePerist() {
		this.hitcount = this.hitcount == null?0 : this.hitcount;
		this.replycnt = this.replycnt == null?0 : this.replycnt;
	}
}
