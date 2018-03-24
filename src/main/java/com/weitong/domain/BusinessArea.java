package com.weitong.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 	业务领域
 */
@Entity
@Table(name="T_BUSINESS_AREA")
public class BusinessArea {
	@Id
	@Column(name="C_ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;				//主键
	@Column(name="C_NAME")
	private String name;			//业务名
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
