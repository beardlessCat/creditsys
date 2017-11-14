package com.creidtsys.apps.manage.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.auth.service.SysUserService;
import com.creidtsys.apps.manage.entity.ResultDetial;
import com.creidtsys.apps.manage.entity.ResultInfo;
import com.creidtsys.utils.UtilTools;


@Service
public class ReadExcelService {
	@Resource
	private PaperService paperService ;
	@Resource
	private SysUserService sysUserService ;
	@Resource
	private ResultInfoService resultInfoService ;
	@Resource
	private ResultDetialService resultDetialService ;
    private int totalRows = 0;  
    //总条数
    private int totalCells = 0; 
    //错误信息接收器
    private String errorMsg;
    //构造方法
    public ReadExcelService(){}
    //获取总行数
    public int getTotalRows()  { return totalRows;} 
    //获取总列数
    public int getTotalCells() {  return totalCells;} 
    //获取错误信息-暂时未用到暂时留着
    public String getErrorInfo() { return errorMsg; }
    
  /**
   * 读EXCEL文件，获取客户信息集合
   * @param fielName
   * @return
   */
  public List<ResultInfo> getExcelInfo(File  file){     
       List<ResultInfo> resultInfoList=new ArrayList<ResultInfo>();
       FileInputStream is = null;
       Workbook wb = null;
       
       try{
          is = new FileInputStream(file);
          if(UtilTools.isExcel2003(file.getName())){
       	   wb = new HSSFWorkbook(is);
          }else{
       	   wb = new XSSFWorkbook(is);
          }
          resultInfoList=readExcelValue(wb);
          is.close();
      }catch(Exception e){
          e.printStackTrace();
      } finally{
          if(is !=null)
          {
              try{
                  is.close();
              }catch(IOException e){
                  is = null;    
                  e.printStackTrace();  
              }
          }
      }
      return resultInfoList;
  }
 
  /**
   * 读取Excel里面客户的信息
   * @param wb
   * @return
   */
  private List<ResultInfo> readExcelValue(Workbook wb){ 
       Sheet sheet=wb.getSheetAt(0);
       this.totalRows=sheet.getPhysicalNumberOfRows();
       if(totalRows>=1 && sheet.getRow(0) != null){//判断行数大于一，并且第一行必须有标题（这里有bug若文件第一行没值就完了）
            this.totalCells=sheet.getRow(0).getPhysicalNumberOfCells();
       }else{
           return null;
       }
       List<ResultInfo> resultInfoList=new ArrayList<ResultInfo>();//声明一个对象集合
       List<String> nameList = new ArrayList<String>();
       for(int r=1;r<totalRows;r++){
    	   ResultInfo  resultInfo = new ResultInfo();
           Row row = sheet.getRow(r);
           String loName = null;
           if (row == null) continue;  
           for(int c = 0; c <this.totalCells; c++){ 
               Cell cell = row.getCell(c);
               if (null != cell){
                   if(c==0){
                	   String paperId = paperService.getIdByCode(getValue(cell));
                	   resultInfo.setRiPaperId(paperId);
                   }else if(c==3){
                	   String userId = sysUserService.getUserByLoginName(getValue(cell)).getUserId() ;
                	   resultInfo.setRiUserId(userId);
                	   loName =getValue(cell) ;
                	   resultInfo.setUserNo(getValue(cell));
                   }
               }
           }
           if(!nameList.contains(loName)){
    		   nameList.add(loName);
    		   resultInfoList.add(resultInfo);
    	   }
       }
       return resultInfoList;
  }
  
  /**
   * 得到Excel表中的值
   * 
   * @param cell
   *            Excel中的每一个格子
   * @return Excel中每一个格子中的值
   */
  private String getValue(Cell cell) {
	  if (cell.getCellType() == cell.CELL_TYPE_BOOLEAN) {
          // 返回布尔类型的值
          return String.valueOf(cell.getBooleanCellValue());
      } else if (cell.getCellType() == cell.CELL_TYPE_NUMERIC) {
    	  DecimalFormat df = new DecimalFormat("#");
          // 返回数值类型的值
          return String.valueOf(df.format(cell.getNumericCellValue()));
      } else {
          // 返回字符串类型的值
          return String.valueOf(cell.getStringCellValue());
      }
  }
  
  
public void addResultDetial(File file, ResultInfo resultInfo) throws Exception {
	// TODO Auto-generated method stub
    FileInputStream is = null;
    Workbook wb = null;
       //根据新建的文件实例化输入流
       is = new FileInputStream(file);
       if(UtilTools.isExcel2003(file.getName())){
    	   wb = new HSSFWorkbook(is);
       }else{
    	   wb = new XSSFWorkbook(is);
       }
       readExcelValues(wb,resultInfo);
       is.close();
}


private void readExcelValues(Workbook wb,ResultInfo resultInfo) {
	String resultId =resultInfo.getResultId() ;
	String name = resultInfo.getUserNo() ;
	double totalResult =0;
    List<ResultDetial> list = new ArrayList<ResultDetial>();
    Sheet sheet=wb.getSheetAt(0);
    this.totalRows=sheet.getPhysicalNumberOfRows();
    if(totalRows>=1 && sheet.getRow(0) != null){//判断行数大于一，并且第一行必须有标题（这里有bug若文件第一行没值就完了）
         this.totalCells=sheet.getRow(0).getPhysicalNumberOfCells();
    }
    for(int r=1;r<totalRows;r++){
    	String userName = "";
        Row row = sheet.getRow(r);
        if (row == null) continue;  
        ResultDetial resultDetial = new ResultDetial() ;
        resultDetial.setRdInfoId(resultId);
        //循环Excel的列
        for(int c = 0; c <this.totalCells; c++){ 
            Cell cell = row.getCell(c);
            if (null != cell){
               if(c==3){
                	userName=cell.getStringCellValue();
                	resultDetial.setUserLoginName(cell.getStringCellValue());
                }else if(c==6){
              	  	String result =subZeroAndDot(Double.toString(cell.getNumericCellValue()));
	              	  if(name.equals(userName)){
	              		totalResult+=cell.getNumericCellValue();
	              	  }
	              	  resultDetial.setRdResult(result);
		         }else if(c==8){
		        	   resultDetial.setRdIndex(subZeroAndDot(Double.toString(cell.getNumericCellValue())));
			     }
            }
        }
        if(name.equals(userName)){
        	resultDetialService.editResult(resultDetial);
        	// list.add(resultDetial);
      	  }
    }
    resultInfo.setRiResult((Double.toString(totalResult)));
    resultInfoService.editRe(resultInfo);

    
}
public static String subZeroAndDot(String s){  
    if(s.indexOf(".") > 0){  
        s = s.replaceAll("0+?$", "");//去掉多余的0  
        s = s.replaceAll("[.]$", "");//如最后一位是.则去掉  
    }  
    return s;  
}  
}
