package com.creidtsys.apps.courseManage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.courseManage.entity.Major;
import com.creidtsys.apps.courseManage.service.MajorService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/major")
public class MajorController {
	@Resource
	private MajorService majorService;
	
	private final String LIST ="jsp/courseManager/major/list" ;
	private final String TONEWJSP = "jsp/courseManager/major/add" ;
	private final String TOEDITJSP ="jsp/courseManager/major/edit" ;
	private final String TONESmajor ="jsp/courseManager/major/nesmajor";
	private final String TOCUsC = "jsp/courseManager/major/listCuSc";
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping("/toCusc")
	public String toCusc(){
		return TOCUsC;
	}
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
	
	@RequestMapping(value="/allMajor",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage allCourse(String majorName){
		List<Major> list = majorService.selectAll(majorName);
		return new JsonMessage().success(list) ;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage delete(String majorId){
		majorService.deleteMajor(majorId);
		return new JsonMessage().success() ;
	}
	
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addMajor(String data) throws JsonParseException, JsonMappingException, IOException{
		Major major = mapper.readValue(data, new TypeReference<Major>() { });
		major.setMajorId(UtilTools.getNum19());
		majorService.addMajor(major);
		return new JsonMessage().success(major.getMajorId());
	}
	
	@RequestMapping(value="/edit" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage editCourse(String data) throws JsonParseException, JsonMappingException, IOException{
		Major major = mapper.readValue(data, new TypeReference<Major>() { });
		majorService.editMajor(major);
		return new JsonMessage().success(major.getMajorId());
	}
	@RequestMapping(value="/initMajor",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String,String>> initCourse(String majorId) throws Exception{
		List<Major> list = majorService.selectAll(majorId); 
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getMajorId()) ;
				newMap.put("text", list.get(i).getMajorName());
				listMap.add(newMap) ;
			}
		return listMap ;
	} 
}
