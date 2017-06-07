package com.lab.util;

import java.io.InputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.lab.model.Paper;

public class ExcelUtil {

	public static void fillExcelData(List<Paper> list,Workbook wb,String[] headers)throws Exception{
		int rowIndex=0;
		Sheet sheet=wb.createSheet();
		Row row=sheet.createRow(rowIndex++);
		for(int i=0;i<headers.length;i++){
			row.createCell(i).setCellValue(headers[i]);
		}
		while(rowIndex<list.size()+1){
			row=sheet.createRow(rowIndex++);
			System.out.println(rowIndex);
			row.createCell(0).setCellValue(list.get(rowIndex-2).getId());
			row.createCell(1).setCellValue(list.get(rowIndex-2).getPaperName());
			row.createCell(2).setCellValue(list.get(rowIndex-2).getPaperAuthors());
			row.createCell(3).setCellValue(list.get(rowIndex-2).getPublication());
			row.createCell(4).setCellValue(list.get(rowIndex-2).getHref());
		}
	}
	
	
	public static Workbook fillExcelDataWithTemplate(List<Paper> list,String templateFileName)throws Exception{
		InputStream inp=ExcelUtil.class.getResourceAsStream("/com/lab/template/"+templateFileName);
		POIFSFileSystem fs=new POIFSFileSystem(inp);
		Workbook wb=new HSSFWorkbook(fs);
		Sheet sheet=wb.getSheetAt(0);
		// ��ȡ����
		int cellNums=sheet.getRow(0).getLastCellNum();
		int rowIndex=1;
		while(rowIndex<list.size()+1){
			Row row=sheet.createRow(rowIndex++);
			row.createCell(0).setCellValue(list.get(rowIndex-2).getId());
			row.createCell(1).setCellValue(list.get(rowIndex-2).getPaperName());
			row.createCell(2).setCellValue(list.get(rowIndex-2).getPaperAuthors());
			row.createCell(3).setCellValue(list.get(rowIndex-2).getPublication());
			row.createCell(4).setCellValue(list.get(rowIndex-2).getHref());
		}
		return wb;
	}
	
	
	public static String formatCell(HSSFCell hssfCell){
		if(hssfCell==null){
			return "";
		}else{
			if(hssfCell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
				return String.valueOf(hssfCell.getBooleanCellValue());
			}else if(hssfCell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
				return String.valueOf(hssfCell.getNumericCellValue());
			}else{
				return String.valueOf(hssfCell.getStringCellValue());
			}
		}
	}
}
