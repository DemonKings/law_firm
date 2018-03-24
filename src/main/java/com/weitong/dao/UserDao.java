package com.weitong.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.weitong.domain.User;

public interface UserDao extends JpaRepository<User, Integer> {

	User findByTelephone(String telephone);

}
