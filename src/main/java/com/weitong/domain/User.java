package com.weitong.domain;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *	用户
 */
@Entity
@Table(name="T_USER")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="C_ID")
	private Integer id;				//主键
	@Column(name="C_USERNAME")
	private String username;		//用户名
	@Column(name="C_PASSWORD")
	private String password;		//密码
	@Column(name="C_TELEPHONE")
	private String telephone;		//手机号
	@Column(name="C_ADDRESS")
	private String address;			//地址
	@Column(name="C_EMAIL")
	private String email;			//邮件
	@Column(name="C_SEX")
	private String sex;				//性别
	@Column(name="C_STATUS")
	private Integer status = 0;		//激活状态   0:未激活	1:已激活
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
