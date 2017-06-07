package com.lab.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lab.model.Member;
import com.lab.model.PageBean;
import com.lab.service.MemberService;
import com.lab.util.ResponseUtil;

@Controller
@RequestMapping("/members")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/list")
	public ModelAndView list(){
		ModelAndView mav=new ModelAndView();
		List<Member> memberList1=memberService.find(2);
		List<Member> memberList2=memberService.find(3);
		mav.addObject("modeName", "Members");
		mav.addObject("memberList1", memberList1);
		mav.addObject("memberList2", memberList2);
		mav.addObject("mainPage", "members/list.jsp");
		mav.setViewName("main");
		return mav;
	}
	
	
	@RequestMapping("/listajax")
	public  void listajax2(@RequestParam(value="page")String page,@RequestParam(value="rows") String rows,Member s_member,HttpServletResponse response ){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		JSONObject result=new JSONObject();
		int total=memberService.count(s_member);
		List<Member> memberList=memberService.find(pageBean, s_member);
		result.put("rows", memberList);
		result.put("total", total);
	    try {
			ResponseUtil.write(result, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	@RequestMapping("/save")
	public void save(Member member,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		if(member.getId()==null){
			memberService.add(member);			
		}else{
			memberService.update(member);
		}
		jsonObject.put("success", "�����ɹ�");
		try {
			ResponseUtil.write(jsonObject, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return "redirect:/member/listajax.do";
	}
	
	@RequestMapping("/delete")
	public void delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		JSONObject result=new JSONObject();
		memberService.delete(ids);
		result.put("success",true);			
		ResponseUtil.write(result, response);
	}
}
