package com.lab.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lab.model.User;
import com.lab.service.UserService;
import com.lab.util.MD5Tool;
import com.lab.util.ResponseUtil;
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(@RequestParam(value="imageCode")String imageCode, User user,HttpServletRequest request){
		User currentUser=userService.login(user);
		HttpSession session=request.getSession();
		if(!imageCode.equals(session.getAttribute("sRand"))){
			request.setAttribute("error", "��֤��������");
			return "admin/login";			
			}
		else if(currentUser.getId()==null){
			request.setAttribute("user", user);
			request.setAttribute("error", "�û���������������");
			return "admin/login";
			
		}else{
			session.setAttribute("currentUser", currentUser);
			return "redirect:/admin/main.jsp";
		}
	}
	
	@RequestMapping("/update")
	public void update(@RequestParam(value="id")String id,@RequestParam(value="oldpassword")String oldpassword,@RequestParam(value="password")String password,HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession();
		User currentUser=(User)session.getAttribute("currentUser");
		JSONObject result=new JSONObject();
		//�ж��û������Ƿ���ȷ
		if(!((currentUser.getPassword()).equals(MD5Tool.MD5(oldpassword)))){
			result.put("error", "�û���������");
		}else {
			User user=userService.loadById(Integer.parseInt(id));
			user.setPassword(password);
			userService.update(user);
			result.put("success", true);
		}
		try {
			ResponseUtil.write(result, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:/admin/login.jsp";
	}
	
	@RequestMapping("/register")
	public void register(User user,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		userService.add(user);
		jsonObject.put("success", "ע���ɹ�");
		try {
			ResponseUtil.write(jsonObject, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
