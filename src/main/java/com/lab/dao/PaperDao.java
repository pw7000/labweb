package com.lab.dao;

import java.util.List;

import com.lab.model.Member;
import com.lab.model.PageBean;
import com.lab.model.Paper;


public interface PaperDao {
	public List<Paper> find(PageBean pageBean);
	public int count();
	
	
	public void add(Paper paper);
	public void update(Paper paper);
	public void delete(String ids);
	public Paper loadById(int id);
	
}
