package com.lab.service;

import com.lab.model.User;

public interface UserService {
	public User login(User user);
	
	public User loadById(int id);
	public void update(User user);
	
	public void add(User user);
	
}
