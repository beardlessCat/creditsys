package com.creidtsys.apps.manage.controller;

import java.util.List;
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
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/technology")
public class TechnologyController {
	@Resource
	private TechnologyService technologyService ; 
	private final String  LIST ="manage/technology/list" ;
	private final String TONEWJSP = "manage/technology/add" ;
	private final String TOEDITJSP ="manage/technology/edit" ;
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
    public JsonMessage allPosition(String technologyName){
    	List<Technology> list = technologyService.selectAll(technologyName);
    	return new JsonMessage().success(list) ;
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
