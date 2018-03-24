package com.weitong.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weitong.dao.UserDao;
import com.weitong.domain.User;
import com.weitong.service.UserService;
import com.weitong.utils.Md5Util;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	//注入UserDao
	@Autowired
	private UserDao userDao;

	/**
	 * 根据手机号查询用户
	 */
	@Override
	public User findByTelephone(String telephone) {
		//调用dao查询
		return userDao.findByTelephone(telephone);
	}
	
	/**
	 * 保存用户
	 */
	@Override
	public void save(User model) {
		//用户密码使用md5加密
		model.setPassword(Md5Util.encode(model.getPassword()));
		//调用dao保存
		userDao.save(model);
	}
}
