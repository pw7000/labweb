package com.lab.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lab.dao.NewsDao;
import com.lab.model.News;
import com.lab.model.PageBean;
import com.lab.service.NewsService;
@Service
public class NewsServiceImpl implements NewsService {
	@Resource
	public NewsDao newsDao;
	@Override
	public List<News> find(PageBean pageBean) {
		return newsDao.find(pageBean);
	}
	@Override
	public int count() {
		return newsDao.count();
	}
	@Override
	public void add(News news) {
		newsDao.add(news);
	}
	@Override
	public void update(News news) {
		newsDao.update(news);
	}
	@Override
	public void delete(String ids) {
		// TODO Auto-generated method stub
		newsDao.delete(ids);
	}
	@Override
	public News loadById(int id) {
		return newsDao.loadById(id);
	}

}
