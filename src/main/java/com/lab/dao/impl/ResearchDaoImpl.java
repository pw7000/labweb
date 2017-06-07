package com.lab.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.lab.dao.ResearchDao;
import com.lab.model.Research;
@Repository("researchDao")
public class ResearchDaoImpl implements ResearchDao {
	@Resource
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<Research> find() {
		String sql="select * from t_research";
		final List<Research> researchList=new ArrayList<Research>();
		jdbcTemplate.query(sql, new RowCallbackHandler() {
			
			@Override
			public void processRow(ResultSet rs) throws SQLException {
				Research research=new Research();
				research.setId(rs.getInt("id"));
				research.setResearchName(rs.getString("researchName"));
				researchList.add(research);
			}
		});
		return researchList;
	}

}
