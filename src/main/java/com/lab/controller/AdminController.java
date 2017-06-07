package com.lab.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/login")
	public ModelAndView list(){
		ModelAndView mav=new ModelAndView();
		mav.addObject("modeName", "Login");
		mav.addObject("mainPage", "admin/login.jsp");
		mav.setViewName("main");
		return mav;
	}
}
