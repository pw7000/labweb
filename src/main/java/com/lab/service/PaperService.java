package com.lab.service;

import java.util.List;

import com.lab.model.Paper;
import com.lab.model.PageBean;

public interface PaperService {
	public List<Paper> find(PageBean pageBean);
	public int count();
	
	public void add(Paper paper);
	public void update(Paper paper);
	public void delete(String ids);
	public Paper loadById(int id);
}
