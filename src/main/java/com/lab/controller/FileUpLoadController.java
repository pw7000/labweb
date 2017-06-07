package com.lab.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file")
/*
 * �ļ��ϴ���ָ���ļ���
 */
public class FileUpLoadController {
	@RequestMapping("/uploadPic")
	public String upLoad(@RequestParam("file") MultipartFile file ,HttpServletRequest request) throws Exception{
		//String filePath=request.getServletContext().getRealPath("/");
		file.transferTo(new File("./webapps/LabProject/images/student/"+file.getOriginalFilename() ));
		return "redirect:/admin/success.jsp";
	}
	
	
	@RequestMapping("/uploadFile")
	public String upLoadFile(@RequestParam("file") MultipartFile file ,HttpServletRequest request) throws Exception{
		file.transferTo(new File("./webapps/LabProject/images/news/"+file.getOriginalFilename() ));
		return "redirect:/admin/success.jsp";
	}
	
	
	@RequestMapping("/uploadInstrument")
	public String upLoadInstrument(@RequestParam("file") MultipartFile file ,HttpServletRequest request) throws Exception{
		file.transferTo(new File("./webapps/LabProject/images/instruments/"+file.getOriginalFilename() ));
		return "redirect:/admin/success.jsp";
	}
	
}
