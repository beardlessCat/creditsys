package com.creidtsys.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class UtilTools {
	  public static  String getNum19(){  
		 String numStr = "" ;       
		 String trandStr = String.valueOf((Math.random() * 9 + 1) * 1000000);     
		 String dataStr = new SimpleDateFormat("yyyyMMddHHMMSS").format(new Date());       
		 numStr = trandStr.toString().substring(0, 4);      
		 numStr = numStr + dataStr ;       
		 return numStr ;   
		}
	  public static String getUUID32(){
		  return UUID.randomUUID().toString().replaceAll("-", "").toUpperCase() ;
	  }
	    public static boolean isExcel2003(String filePath)  {  
	         return filePath.matches("^.+\\.(?i)(xls)$");  
	     }  
	   
	    public static boolean isExcel2007(String filePath)  {  
	         return filePath.matches("^.+\\.(?i)(xlsx)$");  
	     }  
}
