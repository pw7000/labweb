package com.lab.service;

import java.util.List;

import com.lab.model.News;
import com.lab.model.PageBean;

public interface NewsService {
	public List<News> find(PageBean pageBean);
	public int count();
	
	
	public void add(News news);
	public void update(News news);
	public void delete(String ids);
	public News loadById(int id);
}
