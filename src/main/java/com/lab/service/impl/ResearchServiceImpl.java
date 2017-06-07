package com.lab.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lab.dao.ResearchDao;
import com.lab.model.Research;
import com.lab.service.ResearchService;
@Service
public class ResearchServiceImpl implements ResearchService{
	@Autowired
	private ResearchDao researchDao;
	@Override
	public List<Research> find() {
		return researchDao.find();
	}

}
