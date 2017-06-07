package com.lab.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.lab.dao.PaperDao;
import com.lab.model.Paper;
import com.lab.model.PageBean;
@Repository("paperDao")
public class PaperDaoImpl implements PaperDao{
	@Resource
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<Paper> find(PageBean pageBean) {
		StringBuffer sb=new StringBuffer("select * from t_paper order by id desc");
		
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getPageSize());
		}
		final List<Paper> paperList=new ArrayList<Paper>();
		jdbcTemplate.query(sb.toString().replaceFirst("and", "where"), new Object[]{}, new RowCallbackHandler() {
			
			public void processRow(ResultSet rs) throws SQLException {
				Paper paper=new Paper();
				paper.setId(rs.getInt("id"));
				paper.setPaperName(rs.getString("paperName"));
				paper.setPaperAuthors(rs.getString("paperAuthors"));
				paper.setPublication(rs.getString("publication"));
				paper.setHref(rs.getString("href"));
				paperList.add(paper);
			}
		});
		return paperList;
	}

	@Override
	public int count() {
		String sql=new String("select count(*) from t_paper");
		return jdbcTemplate.queryForInt(sql);
	}

	@Override
	public void add(Paper paper) {
		String sql="insert into t_paper values(null,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[]{paper.getPaperName(),paper.getPaperAuthors(),paper.getPublication(),paper.getHref()});
	}

	@Override
	public void update(Paper paper) {
		String sql="update t_paper set paperName=?,paperAuthors=?,publication=?,href=? where id=?";
		jdbcTemplate.update(sql, new Object[]{paper.getPaperName(),paper.getPaperAuthors(),paper.getPublication(),paper.getHref(),paper.getId()});
	}

	@Override
	public void delete(String ids) {
		String sql="delete from t_paper where id in ("+ids+")";
		jdbcTemplate.update(sql, new Object[]{});
		
	}

	@Override
	public Paper loadById(int id) {
		String sql="select * from t_paper where id=?";
		final Paper paper=new Paper();
		jdbcTemplate.query(sql, new Object[]{id}, new RowCallbackHandler() {
			
			@Override
			public void processRow(ResultSet rs) throws SQLException {
				paper.setId(rs.getInt("id"));
				paper.setPaperName(rs.getString("paperName"));
				paper.setPaperAuthors(rs.getString("paperAuthors"));
				paper.setPublication(rs.getString("publication"));
				paper.setHref(rs.getString("href"));
			}
		});
		return paper;
	}
	

}
