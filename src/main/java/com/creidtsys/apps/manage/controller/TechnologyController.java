package com.creidtsys.apps.manage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.manage.entity.Technology;
import com.creidtsys.apps.manage.service.TechnologyService;
import com.creidtsys.utils.JsonMessage;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/technology")
public class TechnologyController {
	@Resource
	private TechnologyService technologyService ; 
	private final String  LIST ="jsp/manage/technology/list" ;
	private final String TONEWJSP = "jsp/manage/technology/add" ;
	private final String TOEDITJSP ="jsp/manage/technology/edit" ;
	private static ObjectMapper mapper = new ObjectMapper();
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
	@RequestMapping(value="/allTechnology",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public  Map<String,Object> allPosition(String data) throws JsonParseException, JsonMappingException, IOException{
	     Technology technology= mapper.readValue(data, new TypeReference<Technology>() { 
		 });
	     int page = Integer.parseInt(technology.getPageNumber()) ;  
         int rows =Integer.parseInt(technology.getPageSize()) ;   
    	 List<Technology> list = technologyService.selectAll(technology.getTechnologyName());
    	 Map<String,Object> map =new HashMap<String, Object>() ;
         map.put("total", list.size()) ;
         PageHelper.startPage(page,rows);
         List<Technology> listPage = technologyService.selectAll(technology.getTechnologyName()); 
         map.put("rows", listPage) ;
         return map;
    }
	 @RequestMapping(value="/add",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public JsonMessage addTechnology(String data) throws Exception{
	    	Technology technology = mapper.readValue(data, new TypeReference<Technology>() { });
	    	technology.setTechnologyId(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
	    	technologyService.add(technology) ;
	    	return new JsonMessage().success() ;
	    }
	    @RequestMapping(value="edit",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public JsonMessage editTechnology(String data) throws Exception{
	    	Technology technology = mapper.readValue(data, new TypeReference<Technology>() { });
	    	technologyService.edit(technology) ;
	    	return new JsonMessage().success() ;
	    }
	    @RequestMapping(value="delete",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public JsonMessage deleteTechnology(String technologyId) throws Exception{
	    	technologyService.deleteTechnology(technologyId) ;
	    	return new JsonMessage().success() ;
	    }
}
