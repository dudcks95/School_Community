package com.example.tspringboot4.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity(name = "school")
public class School {
	@Id
	private String schoolname;
	private String department;
}
