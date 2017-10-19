package com.creidtsys.apps.courseManage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.courseManage.entity.Course;
import com.creidtsys.apps.courseManage.entity.MajorDirect;
import com.creidtsys.apps.courseManage.service.MajorDirectService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/majorDirect")
public class MajorDirectController {
	@Resource
	private MajorDirectService majorDirectService ;
	private final String  LIST ="jsp/courseManager/majorDirect/list" ;
	private final String TONEWJSP = "jsp/courseManager/majorDirect/add" ;
	private final String TOEDITJSP ="jsp/courseManager/majorDirect/edit" ;
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping(value="/list")
	public String list(){
		return LIST ;
	}
	@RequestMapping(value="/toEdit")
	public String toEdit(){
		return TOEDITJSP ;
	}

	@RequestMapping(value="/toAdd")
	public String toAdd(){
		return TONEWJSP ;
	}
	@RequestMapping(value="/allDirect",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private Map<String,Object>  all(String data) throws JsonParseException, JsonMappingException, IOException{
		MajorDirect majorDirect= mapper.readValue(data, new TypeReference<MajorDirect>() { 
		 });
	    int page = Integer.parseInt(majorDirect.getPageNumber()) ;  
        int rows =Integer.parseInt(majorDirect.getPageSize()) ;   
		List<MajorDirect> list = majorDirectService.selectAll(majorDirect.getdMajorId());
		Map<String,Object> map =new HashMap<String, Object>() ;
		map.put("total", list.size()) ;
		PageHelper.startPage(page,rows);
		List<MajorDirect> listPage = majorDirectService.selectAll(majorDirect.getdMajorId());
		map.put("rows", listPage) ;
		return map ;
	}
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage add(String data) throws JsonParseException, JsonMappingException, IOException{
		 MajorDirect  majorDirect = mapper.readValue(data, new TypeReference< MajorDirect>() { });
		 majorDirect.setMajorDirectId(UtilTools.getNum19());
		 majorDirectService.add(majorDirect);
		return new JsonMessage().success();
	}
	@RequestMapping(value="/edit",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage edit(String data) throws Exception{
		 MajorDirect  majorDirect = mapper.readValue(data, new TypeReference< MajorDirect>() { });
		 majorDirectService.editType(majorDirect);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/delete",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage delete(String majorDirectId){
		majorDirectService.deleteType(majorDirectId);
		return new JsonMessage().success() ;
	}
}
