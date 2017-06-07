package com.lab.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/contact")
public class ContactController {
	
	@RequestMapping("/list")
	public ModelAndView list(){
		ModelAndView mav=new ModelAndView();
		mav.addObject("modeName", "Contact us");
		mav.addObject("mainPage", "contact/list.jsp");
		mav.setViewName("main");
		return mav;
	}
}
