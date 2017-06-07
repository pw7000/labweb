package com.lab.dao;


import com.lab.model.User;

public interface UserDao {
	public User login(User user);
	
	public User loadById(int id);
	public void update(User user);
	
	public void add(User user);
	
}
