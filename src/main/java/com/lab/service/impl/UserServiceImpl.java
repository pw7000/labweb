package com.lab.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lab.dao.UserDao;
import com.lab.model.User;
import com.lab.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	@Override
	public User login(User user) {
		return userDao.login(user);
	}
	@Override
	public void update(User user) {
		userDao.update(user);
	}
	@Override
	public User loadById(int id) {
		return userDao.loadById(id);
	}
	@Override
	public void add(User user) {
		userDao.add(user);
	}

}
