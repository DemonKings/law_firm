package com.weitong.service;

import com.weitong.domain.User;

public interface UserService {

	User findByTelephone(String telephone);

	void save(User model);

}
