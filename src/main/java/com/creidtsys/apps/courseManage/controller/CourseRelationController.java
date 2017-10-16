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

import com.creidtsys.apps.courseManage.entity.CourseRelation;
import com.creidtsys.apps.courseManage.service.CourseRelationService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/courseRelation")
public class CourseRelationController {
	@Resource
	private CourseRelationService courseRelationService ;
	private final String TOLIST="courseManager/courseRelation/listTree"; 
	private final String TOADD = "courseManager/courseRelation/add" ;
	private final String TOEDIT ="courseManager/courseRelation/edit" ;
	private final String TOADDUNIT = "courseManager/courseRelation/listUnit";
	private final String TOASSPOINT =  "courseManager/courseRelation/listPoint" ;
	@RequestMapping("/toAddUnit")
	private String toAddUnit(){
		return TOADDUNIT ;
	}
	@RequestMapping("/toAddPoint")
	private String toAddPoint(){
		return  TOASSPOINT;
	} 
	@RequestMapping("/toAdd")
	public String toAdd(){
		return TOADD ;
	}
	@RequestMapping("/toEdit")
	public String toEdit(){
		return TOEDIT;
	}
	@RequestMapping("/toList") 
	public String toList(){
		return TOLIST ;
	}
	private static ObjectMapper mapper = new ObjectMapper();
	public JsonMessage addRela(String data) throws Exception{
		CourseRelation courseRelation = mapper.readValue(data, new TypeReference<CourseRelation>() { });
		courseRelationService.addRela(courseRelation);
		return new JsonMessage().success();
	}
	@RequestMapping(value="/treeData" )
    @ResponseBody
	public Map<String,Object> getData(String otherId){
		List<CourseRelation> list= courseRelationService.getTreeGrid(otherId);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", list.size());
		map.put("rows", list);
		return map;
	}
	@RequestMapping(value="/addRe" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addCours(String data) throws JsonParseException, JsonMappingException, IOException{
		CourseRelation courseRelation = mapper.readValue(data, new TypeReference<CourseRelation>() { });
		courseRelation.setSrId(UtilTools.getNum19());
		courseRelationService.addRela(courseRelation);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/del",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage delete(String srId){
		courseRelationService.deleteCourseRe(srId);
		return new JsonMessage().success() ;
	}
}
