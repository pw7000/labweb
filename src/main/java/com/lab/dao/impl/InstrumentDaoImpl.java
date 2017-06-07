package com.lab.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.lab.dao.InstrumentDao;
import com.lab.model.Instrument;
@Repository
public class InstrumentDaoImpl implements InstrumentDao {
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	
	@Override
	public List<Instrument> find() {
		String sql="select * from t_instrument";
		final List<Instrument> instrumentList=new ArrayList<Instrument>();
		jdbcTemplate.query(sql, new Object[]{},new RowCallbackHandler(){
			public void processRow(ResultSet rs) throws SQLException {
				Instrument instrument=new Instrument();
				instrument.setId(rs.getInt("id"));
				instrument.setName(rs.getString("name"));
				instrument.setPic(rs.getString("pic"));
				instrument.setContent(rs.getString("content"));
				instrumentList.add(instrument);
			}
		});
		return instrumentList;
	}


	@Override
	public void delete(String ids) {
		String sql="delete from t_instrument where id in ("+ids+")";
		jdbcTemplate.update(sql,new Object[]{});
	}


	@Override
	public int count() {
		String sql="select count(*) from t_instrument";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}


	@Override
	public void add(Instrument instrument) {
		String sql="insert into t_instrument values(null,?,?,?)";
		jdbcTemplate.update(sql, new Object[]{instrument.getName(),instrument.getPic(),instrument.getContent()});
		
	}


	@Override
	public void update(Instrument instrument) {
		String sql="update t_instrument set name=?,pic=?,content=? where id=?";
		jdbcTemplate.update(sql, new Object[]{instrument.getName(),instrument.getPic(),instrument.getContent(),instrument.getId()});
		
	}

}
