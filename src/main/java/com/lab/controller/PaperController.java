package com.lab.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lab.model.PageBean;
import com.lab.model.Paper;
import com.lab.service.PaperService;
import com.lab.util.ExcelUtil;
import com.lab.util.PageUtil;
import com.lab.util.ResponseUtil;
import com.lab.util.StringUtil;

@Controller
@RequestMapping("/paper")
public class PaperController {
	@Autowired
	private PaperService paperService;
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value="page",required=false)String page,HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),10);
		List<Paper> paperList=paperService.find(pageBean);
		int total=paperService.count();
		String pageCode=PageUtil.getPagation(request.getContextPath()+"/paper/list.do", total, Integer.parseInt(page), 10);
		mav.addObject("pageCode", pageCode);
		mav.addObject("modeName", "Paper");
		mav.addObject("paperList", paperList);
		mav.addObject("mainPage", "paper/list.jsp");
		mav.setViewName("main");
		return mav;
	}
	
	
	@RequestMapping("/listajax")
	public  void listajax2(@RequestParam(value="page")String page,@RequestParam(value="rows") String rows,Paper s_paper,HttpServletResponse response ){
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		JSONObject result=new JSONObject();
		int total=paperService.count();
		List<Paper> paperList=paperService.find(pageBean);
		result.put("rows", paperList);
		result.put("total", total);
	    try {
			ResponseUtil.write(result, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("/save")
	public void save(Paper paper,HttpServletResponse response){
		JSONObject jsonObject=new JSONObject();
		if(paper.getId()==null){
			paperService.add(paper);			
		}else{
			paperService.update(paper);
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
		paperService.delete(ids);
		result.put("success", true);			
		ResponseUtil.write(result, response);
	}
	
	
	@RequestMapping("/export")
	public String export(HttpServletResponse response)throws Exception{
		List<Paper> paperList=paperService.find( null);
		Workbook wb=new HSSFWorkbook();
		String headers[]={"����","���±���","����","��־","����"};
		ExcelUtil.fillExcelData(paperList, wb, headers);
		ResponseUtil.export(response, wb, "����excel.xls");
		return null;
	}
	
	@RequestMapping("/export2")
	public String export2(HttpServletResponse response)throws Exception{
		List<Paper> paperList=paperService.find(null);
		Workbook wb=ExcelUtil.fillExcelDataWithTemplate(paperService.find( null), "paperExporTemplate.xls");
		ResponseUtil.export(response, wb, "����ģ�浼��excel.xls");
		return null;
	}
	
	public String upload(HttpServletResponse response,@RequestParam("paperUploadFile") String paperUploadFile)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(new FileInputStream(paperUploadFile));
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // ��ȡ��һ��Sheetҳ
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if(hssfRow==null){
					continue;
				}
				Paper paper=new Paper();
				paper.setPaperName(ExcelUtil.formatCell(hssfRow.getCell(0)));
				paper.setPaperAuthors(ExcelUtil.formatCell(hssfRow.getCell(1)));
				paper.setPublication(ExcelUtil.formatCell(hssfRow.getCell(2)));
				paper.setHref(ExcelUtil.formatCell(hssfRow.getCell(3)));
				
			}
		}
		JSONObject result=new JSONObject();
		result.put("success", "true");
		ResponseUtil.write(result, response);
		return null;
	}
	
	
}
