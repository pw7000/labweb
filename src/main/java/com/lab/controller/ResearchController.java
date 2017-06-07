package com.lab.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lab.model.Research;
import com.lab.service.ResearchService;

@Controller
@RequestMapping("/research")
public class ResearchController {
	@Autowired
	private ResearchService researchService;
	@RequestMapping("/list")
	public ModelAndView list(){
		ModelAndView mav=new ModelAndView();
		List<Research> researchList=researchService.find();
		mav.addObject("modeName", "Research");
		mav.addObject("researchList", researchList);
		mav.addObject("mainPage", "research/list.jsp");
		mav.setViewName("main");
		return mav;
	}
}
