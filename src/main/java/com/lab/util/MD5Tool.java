package com.lab.util;
import java.security.MessageDigest;




public class MD5Tool {
	 public static String MD5(String str) { 
		 char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',   
				    'a', 'b', 'c', 'd', 'e', 'f'};  
		 StringBuffer sb=new StringBuffer();
		 byte[] input=str.getBytes();
		 try {
			MessageDigest md=MessageDigest.getInstance("MD5");
			byte[] output=md.digest(input);
			for(int i=0;i<output.length;i++){
				sb.append(hexDigits[output[i]>>>4&15]);
				sb.append(hexDigits[output[i]&0xF]);
			}
			return sb.toString();
		 } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		 }
	 }
	 public static void main(String[] args) {
		 System.out.println("hilliver:"+MD5Tool.MD5("123456"));
		 System.out.println("wudi:"+MD5Tool.MD5("12"));
	}
}
