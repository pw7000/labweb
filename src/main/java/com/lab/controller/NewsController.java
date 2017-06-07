package com.lab.controller;

import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lab.model.News;
import com.lab.model.PageBean;
import com.lab.service.NewsService;
import com.lab.util.PageUtil;
import com.lab.util.ResponseUtil;
import com.lab.util.StringUtil;

@Controller
@RequestMapping("/news")
public class NewsController {
	@Autowired
	private NewsService newsService;
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value="page",required=false)String page,HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),4);
		List<News> newsList=newsService.find(pageBean);
		List<News> newsListSort=new ArrayList<News>(); //sort
		int listsize=newsList.size();
		for(int i = 0;i < listsize; i ++){
            		newsListSort.add(newsList.get(listsize-i-1));
        	}
	    	int total=newsService.count();	
		String pageCode=PageUtil.getPagation(request.getContextPath()+"/news/list.do", total, Integer.parseInt(page), 4);
		mav.addObject("pageCode", pageCode);
		mav.addObject("modeName", "News");
		mav.addObject("newsList", newsListSort);
		mav.addObject("mainPage", "news/list.jsp");
		mav.setViewName("main");
		return mav;
	}
	
	
	@RequestMapping("/listajax")
	public  void listajax2(@RequestParam(value="page")String page,@RequestParam(value="rows") String rows,HttpServletResponse response ){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		JSONObject result=new JSONObject();
		int total=newsService.count();
		List<News> newsList=newsService.find(pageBean);
		result.put("rows", newsList);
		result.put("total", total);
	    try {
			ResponseUtil.write(result, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	@RequestMapping("/save")
	public void save(News news,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		if(news.getId()==null){
			newsService.add(news);			
		}else{
			newsService.update(news);
		}
		jsonObject.put("success", "�����ɹ�");
		try {
			ResponseUtil.write(jsonObject, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delete")
	public void delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		JSONObject result=new JSONObject();
		newsService.delete(ids);
		result.put("success", "ɾ���ɹ�");			
		ResponseUtil.write(result, response);
	}
}
