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

import com.creidtsys.apps.manage.entity.Position;
import com.creidtsys.apps.manage.service.PositionService;
import com.creidtsys.utils.JsonMessage;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/position")
public class PositionController {
	@Resource
	private PositionService positionService ;
	private final String  LIST ="jsp/manage/position/list" ;
	private final String TONEWJSP = "jsp/manage/position/add" ;
	private final String TOEDITJSP ="jsp/manage/position/edit" ;
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
    @RequestMapping(value="/allPosition",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String,Object> allPosition(String data) throws JsonParseException, JsonMappingException, IOException{
    	Position position= mapper.readValue(data, new TypeReference<Position>() { 
		 });
		int page = Integer.parseInt(position.getPageNumber()) ;  
        int rows =Integer.parseInt(position.getPageSize()) ;
    	List<Position> list = positionService.selectAll(position.getPositionName());
    	Map<String,Object> map =new HashMap<String, Object>() ;
		map.put("total", list.size()) ;
		PageHelper.startPage(page,rows);
		List<Position> listPage = positionService.selectAll(position.getPositionName());  
		map.put("rows", listPage) ;
		return map ;
    }
    @RequestMapping(value="/add",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public JsonMessage addPosition(String data) throws Exception{
    	Position position = mapper.readValue(data, new TypeReference<Position>() { });
    	position.setPositionId(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
    	positionService.add(position) ;
    	return new JsonMessage().success() ;
    }
    @RequestMapping(value="edit",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public JsonMessage editPosition(String data) throws Exception{
    	Position position = mapper.readValue(data, new TypeReference<Position>() { });
    	positionService.edit(position) ;
    	return new JsonMessage().success() ;
    }
    @RequestMapping(value="delete",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public JsonMessage deletePosition(String positionId) throws Exception{
    	positionService.deletePosition(positionId) ;
    	return new JsonMessage().success() ;
    }
}
