package com.lab.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.lab.dao.MemberDao;
import com.lab.model.Member;
import com.lab.model.PageBean;
import com.lab.util.StringUtil;
@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	@Override
	public List<Member> find(int memberType) {
		String sql=new String("select * from t_member where memberType=?");
		final List<Member> memberList=new ArrayList<Member>();
		jdbcTemplate.query(sql, new Object[]{memberType}, new RowCallbackHandler(){

			@Override
			public void processRow(ResultSet rs) throws SQLException {
				Member member=new Member();
				member.setId(rs.getInt("id"));
				member.setMemberName(rs.getString("memberName"));
				member.setEmail(rs.getString("email"));
				member.setMemberPic(rs.getString("memberPic"));
				memberList.add(member);
			}
			
		});
		return memberList;
	}


	@Override
	public int count(Member s_member) {
		StringBuffer sb=new StringBuffer("select count(*) from t_member");
		if(s_member!=null){
			if(StringUtil.isNotEmpty(s_member.getMemberName())){
				sb.append(" and memberName like '%"+s_member.getMemberName()+"%'");
			}
		}
		return jdbcTemplate.queryForObject(sb.toString().replaceFirst("and", "where"), Integer.class);
	}


	@Override
	public List<Member> find(PageBean pageBean, Member s_member) {
		StringBuffer sb=new StringBuffer("select * from t_member");
		if(s_member!=null){
			if(StringUtil.isNotEmpty(s_member.getMemberName())){
				sb.append(" and memberName like '%"+s_member.getMemberName()+"%'");
			}
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getPageSize());
		}
		final List<Member> memberList=new ArrayList<Member>();
		jdbcTemplate.query(sb.toString().replaceFirst("and", "where"), new Object[]{}, new RowCallbackHandler() {
			
			public void processRow(ResultSet rs) throws SQLException {
				Member member=new Member();
				member.setId(rs.getInt("id"));
				member.setMemberName(rs.getString("memberName"));
				member.setEmail(rs.getString("email"));
				member.setMemberPic(rs.getString("memberPic"));
				member.setMemberType(rs.getInt("memberType"));
				memberList.add(member);
			}
		});
		return memberList;
	}


	@Override
	public void add(Member member) {
		String sql="insert into t_member values(null,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[]{member.getMemberName(),member.getEmail(),member.getMemberPic(),member.getMemberType()});
		
	}


	@Override
	public void update(Member member) {
		String sql="update t_member set memberName=?,email=?,memberPic=?,memberType=? where id=?";
		jdbcTemplate.update(sql, new Object[]{member.getMemberName(),member.getEmail(),member.getMemberPic(),member.getMemberType(),member.getId()});
		
	}


	@Override
	public void delete(String ids) {
		String sql="delete from t_member where id in ("+ids+")";
		
		jdbcTemplate.update(sql,new Object[]{});
		
	}


	@Override
	public Member loadById(int id) {
		String sql="select * from t_member where id=?";
		final Member member=new Member();
		jdbcTemplate.query(sql, new Object[]{id}, new RowCallbackHandler() {
			
			@Override
			public void processRow(ResultSet rs) throws SQLException {
				member.setId(rs.getInt("id"));
				member.setMemberName(rs.getString("memberName"));
				member.setEmail(rs.getString("email"));
				member.setMemberPic(rs.getString("memberPic"));
				member.setMemberType(rs.getInt("memberType"));
			}
		});
		return member;
	}


	

	

}
