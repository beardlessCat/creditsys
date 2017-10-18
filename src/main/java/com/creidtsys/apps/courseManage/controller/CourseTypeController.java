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

import com.creidtsys.apps.courseManage.entity.Course;
import com.creidtsys.apps.courseManage.entity.CourseType;
import com.creidtsys.apps.courseManage.service.CourseTypeService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;

@Controller
@RequestMapping("/courseType")
public class CourseTypeController {
	@Resource
	private CourseTypeService courseTypeService ;
	private final String  LIST ="jsp/courseManager/courseType/list" ;
	private final String TONEWJSP = "jsp/courseManager/courseType/add" ;
	private final String TOEDITJSP ="jsp/courseManager/courseType/edit" ;
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
	@RequestMapping(value="/allType",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private Map<String,Object> allCourse(String data) throws JsonParseException, JsonMappingException, IOException{
		CourseType courseType= mapper.readValue(data, new TypeReference<CourseType>() { 
		 });
	    int page = Integer.parseInt(courseType.getPageNumber()) ;  
        int rows =Integer.parseInt(courseType.getPageSize()) ;   
		List<CourseType> list = courseTypeService.selectAll();
		Map<String,Object> map =new HashMap<String, Object>() ;
		map.put("total", list.size()) ;
		PageHelper.startPage(page,rows);
		List<CourseType> listPage = courseTypeService.selectAll(); 
		map.put("rows", listPage) ;
		return map ;
	}
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addUnit(String data) throws JsonParseException, JsonMappingException, IOException{
		CourseType courseType = mapper.readValue(data, new TypeReference<CourseType>() { });
		courseType.setCtypeId(UtilTools.getNum19());
		courseTypeService.add(courseType);
		return new JsonMessage().success();
	}
	@RequestMapping(value="/edit",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage editType(String data) throws Exception{
		CourseType courseType = mapper.readValue(data, new TypeReference<CourseType>() { });
		courseTypeService.editType(courseType);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/delete",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage deleteType(String ctypeId){
		courseTypeService.deleteType(ctypeId);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/initType",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String,String>> initType() throws Exception{
		List<CourseType> list = courseTypeService.selectAll();
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getCtypeId()) ;
				newMap.put("text", list.get(i).getCtypeName());
				listMap.add(newMap) ;
			}
		return listMap;
	}
}
