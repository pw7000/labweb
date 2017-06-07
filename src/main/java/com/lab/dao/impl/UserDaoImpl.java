package com.lab.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.lab.dao.UserDao;
import com.lab.model.News;
import com.lab.model.User;
import com.lab.util.MD5Tool;
@Repository("userDao")
public class UserDaoImpl implements UserDao {
	@Resource
	private JdbcTemplate jdbcTemplate;
	@Override
	public User login(User user) {
		String sql="select * from t_admin where userName=? and password=?";
		final User currentUser=new User();
		jdbcTemplate.query(sql, new Object[]{user.getUserName(),MD5Tool.MD5(user.getPassword())},new RowCallbackHandler(){
			
			@Override
			public void processRow(ResultSet rs) throws SQLException {
				currentUser.setId(rs.getInt("id"));
				currentUser.setUserName(rs.getString("userName"));
				currentUser.setPassword(rs.getString("password"));
			}
			
		} );
		return currentUser;
		
		
	}
	
	
	
	@Override
	public void update(User user) {
		String sql="update t_admin set password=? where id=?";
		jdbcTemplate.update(sql, new Object[]{MD5Tool.MD5(user.getPassword()),user.getId()});

	}



	@Override
	public User loadById(int id) {
        String sql="select * from t_admin where id=?";
		final User user=new User();
		jdbcTemplate.query(sql, new Object[]{id}, new RowCallbackHandler() {
			
			@Override
			public void processRow(ResultSet rs) throws SQLException {
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(rs.getString("password"));
			}
		});
		return user;
	}



	@Override
	public void add(User user) {
		String sql="insert into t_admin values(null,?,?)";
		jdbcTemplate.update(sql, new Object[]{user.getUserName(),user.getPassword()});
		
	}



	



	

}
