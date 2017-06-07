package com.lab.service;

import java.util.List;

import com.lab.model.Instrument;

public interface InstrumentService {
	public List<Instrument> find();
	
	public int count();
	public void delete(String ids);
	
	
	public void add(Instrument instrument);
	public void update(Instrument instrument);
}
