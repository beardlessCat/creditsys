package com.creidtsys.apps.manage.controller;

import java.util.List;
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
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/position")
public class PositionController {
	@Resource
	private PositionService positionService ;
	private final String  LIST ="manage/position/list" ;
	private final String TONEWJSP = "manage/position/add" ;
	private final String TOEDITJSP ="manage/position/edit" ;
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
    public JsonMessage allPosition(String positionName){
    	List<Position> list = positionService.selectAll(positionName);
    	return new JsonMessage().success(list) ;
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
