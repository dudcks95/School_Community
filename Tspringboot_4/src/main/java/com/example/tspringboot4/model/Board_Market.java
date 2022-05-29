package com.example.tspringboot4.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
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
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity(name = "board_market")
public class Board_Market {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long mno;
	private String mpname; // 물건이름, 제목
	private String m_writer;
	private String m_pcontent;
	private Long price;
	private Long hitcount;

	@Transient
	private MultipartFile upload; // 업로드할 파일

	private String m_pimage; // 테이블에 저장할 파일이름

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date m_regdate;

	@ManyToOne
	@JoinColumn(name = "user_no")
	private User user;

	@PrePersist
	public void prePerist() {
		this.hitcount = this.hitcount == null ? 0 : this.hitcount;

	}
}
