package com.lab.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lab.dao.InstrumentDao;
import com.lab.model.Instrument;
import com.lab.service.InstrumentService;
@Service
public class InstrumentServiceImpl implements InstrumentService{
	@Resource
	private InstrumentDao instrumentDao;
	@Override
	public List<Instrument> find() {
		return instrumentDao.find();
	}
	@Override
	public void delete(String ids) {
		instrumentDao.delete(ids);
	}
	@Override
	public int count() {
		return instrumentDao.count();
	}
	@Override
	public void add(Instrument instrument) {
		instrumentDao.add(instrument);
	}
	@Override
	public void update(Instrument instrument) {
		instrumentDao.update(instrument);
	}

}
