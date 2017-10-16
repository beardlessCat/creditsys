package com.creidtsys.apps.courseManage.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.courseManage.entity.MajorDirect;
import com.creidtsys.apps.courseManage.entity.MajorDirectService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/majorDirect")
public class MajorDirectController {
	@Resource
	private MajorDirectService majorDirectService ;
	private final String  LIST ="courseManager/majorDirect/list" ;
	private final String TONEWJSP = "courseManager/majorDirect/add" ;
	private final String TOEDITJSP ="courseManager/majorDirect/edit" ;
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
	private JsonMessage all(String majorId){
		List<MajorDirect> list = majorDirectService.selectAll(majorId);
		return new JsonMessage().success(list) ;
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
