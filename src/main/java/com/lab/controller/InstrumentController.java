package com.lab.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lab.model.Instrument;
import com.lab.model.Member;
import com.lab.model.News;
import com.lab.model.PageBean;
import com.lab.service.InstrumentService;
import com.lab.util.ResponseUtil;

@Controller
@RequestMapping("/instruments")
public class InstrumentController {
	@Autowired
	private InstrumentService instrumentService;
	
	@RequestMapping("/list")
	public ModelAndView list(){
		ModelAndView mav=new ModelAndView();
		List<Instrument> instrumentList=instrumentService.find();
		mav.addObject("modeName", "Instruments");
		mav.addObject("instrumentList", instrumentList);
		mav.addObject("mainPage", "instruments/list.jsp");
		mav.setViewName("main");
		return mav;
	}
	
	
	@RequestMapping("/listajax")
	public  void listajax2(@RequestParam(value="page")String page,@RequestParam(value="rows") String rows,Instrument s_instrument,HttpServletResponse response ){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		int total=instrumentService.count();
		JSONObject result=new JSONObject();
		List<Instrument> instrumentList=instrumentService.find();
		result.put("rows", instrumentList);
		result.put("total", total);
	    try {
			ResponseUtil.write(result, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/delete")
	public void delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		JSONObject result=new JSONObject();
		instrumentService.delete(ids);
		result.put("success", true);			
		ResponseUtil.write(result, response);
	}
	
	
	@RequestMapping("/save")
	public void save(Instrument instrument,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		if(instrument.getId()==null){
			instrumentService.add(instrument);			
		}else{
			instrumentService.update(instrument);
		}
		jsonObject.put("success", "�����ɹ�");
		try {
			ResponseUtil.write(jsonObject, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
