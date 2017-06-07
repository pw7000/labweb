package com.lab.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.lab.dao.NewsDao;
import com.lab.model.News;
import com.lab.model.PageBean;
@Repository("newsDao")
public class NewsDaoImpl implements NewsDao {
	

	@Resource
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<News> find(PageBean pageBean) {
		StringBuffer sb=new StringBuffer("select * from t_news");
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getPageSize());
		}
		final List<News> newsList=new ArrayList<News>();
		jdbcTemplate.query(sb.toString(), new RowCallbackHandler() {
			
			public void processRow(ResultSet rs) throws SQLException {
				News news=new News();
				news.setId(rs.getInt("id"));
				news.setNewsName(rs.getString("newsName"));
				news.setNewsContent(rs.getString("newsContent"));
				news.setNewsPic(rs.getString("newsPic"));
				newsList.add(news);
			}
		});
		return newsList;
	}

	

	@Override
	public void add(News news) {
		// TODO Auto-generated method stub
		String sql="insert into t_news values(null,?,?,?)";
		jdbcTemplate.update(sql, new Object[]{news.getNewsName(),news.getNewsContent(),news.getNewsPic()});
	}

	@Override
	public void update(News news) {
		String sql="update t_news set newsName=?,newsContent=?,newsPic=? where id=?";
		jdbcTemplate.update(sql, new Object[]{news.getNewsName(),news.getNewsContent(),news.getNewsPic(),news.getId()});
		
	}
	
	@Override
	public void delete(String ids) {
		String sql="delete from t_news where id in ("+ids+")";
		jdbcTemplate.update(sql, new Object[]{});
		
	}

	@Override
	public News loadById(int id) {
		String sql="select * from t_news where id=?";
		final News news=new News();
		jdbcTemplate.query(sql, new Object[]{id}, new RowCallbackHandler() {
			
			@Override
			public void processRow(ResultSet rs) throws SQLException {
				news.setId(rs.getInt("id"));
				news.setNewsName(rs.getString("newsName"));
				news.setNewsContent(rs.getString("newsContent"));
				news.setNewsPic(rs.getString("newsPic"));
			}
		});
		return news;
	}



	@Override
	public int count() {
		String sql="select count(*) from t_news";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

}
