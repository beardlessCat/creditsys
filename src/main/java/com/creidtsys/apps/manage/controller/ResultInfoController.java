package com.creidtsys.apps.manage.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.creidtsys.apps.manage.entity.Paper;
import com.creidtsys.apps.manage.entity.ResultDetial;
import com.creidtsys.apps.manage.entity.ResultInfo;
import com.creidtsys.apps.manage.service.PaperService;
import com.creidtsys.apps.manage.service.ReadExcelService;
import com.creidtsys.apps.manage.service.ResultDetialService;
import com.creidtsys.apps.manage.service.ResultInfoService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value="/resultInfo")
public class ResultInfoController {
	@Resource
	private ResultInfoService resultInfoService ;
	@Resource
	private ReadExcelService readExcelService ;
	@Resource
	private ResultDetialService detialService  ;
	@Resource
	private PaperService paperService ;
	private File readFile ;
	private List<ResultInfo> resultIdList ;
	private final String  LIST ="jsp/manage/resultInfo/list" ;
	private final String TONEWJSP = "jsp/manage/resultInfo/add" ;
	private final String TOEDITJSP ="jsp/manage/resultInfo/edit" ;	
	private final String TOADDINFO = "jsp/manage/resultInfo/addInfo";
	private final String TOADDMANY ="jsp/manage/resultInfo/addMany" ;
	private static ObjectMapper mapper = new ObjectMapper();	
	@RequestMapping("/toAddMany")
	public String toAddMany(){
		return TOADDMANY ;
	}
	@RequestMapping("/addInfo")
	public String toAddInfo(){
		return TOADDINFO ;
	}
	@RequestMapping("/list")
	public String list(){
		return LIST ;                                 
	}
    @RequestMapping("/toNew")
    public String toNew(){
    	return TONEWJSP ;
    }
    @RequestMapping("/toEdit")
    public String toEdit(){
    	return TOEDITJSP ;
    }
    @RequestMapping(value="/list",method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public Map<String,Object> queryAll(String riPaperId){
		List<ResultInfo> list = resultInfoService.findAll(riPaperId);
		Map<String,Object> map =new HashMap<String, Object>() ;
		map.put("total", list.size()) ;
		map.put("rows", list) ;
		return map ;
	}
    @RequestMapping(value="/add",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage addResultInfo(String data) throws Exception{
		 ResultInfo  resultInfo= mapper.readValue(data, new TypeReference<ResultInfo>() { 
		 });
		 resultInfo.setResultId(UtilTools.getNum19().toUpperCase());
		 resultInfoService.add(resultInfo);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/edit",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage editResultInfo(String data) throws Exception{
		ResultInfo  resultInfo= mapper.readValue(data, new TypeReference<ResultInfo>() { 
		 });
		resultInfoService.editresultInfo(resultInfo);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/delete",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage deleteCompany(String data) throws Exception{
		ResultInfo  resultInfo= mapper.readValue(data, new TypeReference<ResultInfo>() { 
	 });
		resultInfoService.deleteCompany(resultInfo.getResultId());
		ResultDetial resultDetial = new ResultDetial();
		resultDetial.setRdInfoId(resultInfo.getResultId());
	//	resultDetial.setUserLoginName(resultInfo.getUserLoginName());
		detialService.delete(resultDetial);
		return new JsonMessage().success() ;
	}
	//批量添加成绩
	@RequestMapping(value="/addResults",method = RequestMethod.POST) 
	@ResponseBody 
	public JsonMessage analazyMapExtent(@RequestParam("file")  MultipartFile file,HttpServletRequest request) throws Exception {
		String path=request.getSession().getServletContext().getRealPath("");
	    String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));     
	    String fileName = UUID.randomUUID().toString()+ suffix; 
	    File f=new File(path,fileName);
	    file.transferTo(f);
	    List<ResultInfo> list = batchImport(f);
	    readFile=f;
	 //   f.delete() ;
	    System.out.println("addSi---"+list.size());
		return new JsonMessage().success(list);
	}
	public List<ResultInfo> batchImport(File file) throws Exception{
		resultIdList= new ArrayList<ResultInfo>();
        //创建处理EXCEL
        //解析excel，获取客户信息集合。
        List<ResultInfo> resultList = readExcelService.getExcelInfo(file);
        for(ResultInfo resultInfo:resultList){
        	if(!resultInfoService.isExist(resultInfo)){
        		//判断是否存在
        		Paper paper = paperService.getById(resultInfo.getRiPaperId());
        		resultInfo.setResultId(UtilTools.getNum19().toUpperCase());
        		resultInfo.setResultTotal(paper.getUserTotal());
            	resultInfoService.add(resultInfo);
            	resultIdList.add(resultInfo) ;
            	//详情的编辑
        	}
        }
        return resultList;
    }
	@RequestMapping(value="/initDetial",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage initDetial() throws Exception{
		for(ResultInfo resultInfo : resultIdList){
			readExcelService.addResultDetial(readFile,resultInfo);
	    //	detialService.edit(list);;
		}
	   

		return new JsonMessage().success() ;
	}
}
