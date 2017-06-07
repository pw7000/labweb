package com.lab.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lab.dao.PaperDao;
import com.lab.model.PageBean;
import com.lab.model.Paper;
import com.lab.service.PaperService;
@Service
public class PaperServiceImpl implements PaperService {
	@Autowired
	private PaperDao paperDao;
	@Override
	public List<Paper> find(PageBean pageBean) {
		return paperDao.find(pageBean);
	}

	@Override
	public int count() {
		return paperDao.count();
	}

	@Override
	public void add(Paper paper) {
		paperDao.add(paper);
	}

	@Override
	public void update(Paper paper) {
		paperDao.update(paper);
	}

	@Override
	public void delete(String ids) {
		paperDao.delete(ids);
	}

	@Override
	public Paper loadById(int id) {
		return paperDao.loadById(id);
	}

}
