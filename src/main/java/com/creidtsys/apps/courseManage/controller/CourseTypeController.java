package com.creidtsys.apps.courseManage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sys.auth.utils.JsonMessage;
import cn.sys.courseManage.entity.CourseType;
import cn.sys.courseManage.entity.Unit;
import cn.sys.courseManage.service.CourseTypeService;
import cn.sys.manage.entity.CompanyType;
import cn.sys.utils.UtilTools;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/courseType")
public class CourseTypeController {
	@Resource
	private CourseTypeService courseTypeService ;
	private final String  LIST ="courseManager/courseType/list" ;
	private final String TONEWJSP = "courseManager/courseType/add" ;
	private final String TOEDITJSP ="courseManager/courseType/edit" ;
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
	private JsonMessage allCourse(){
		List<CourseType> list = courseTypeService.selectAll();
		return new JsonMessage().success(list) ;
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
	public JSONArray initType() throws Exception{
		List<CourseType> list = courseTypeService.selectAll();
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getCtypeId()) ;
				newMap.put("text", list.get(i).getCtypeName());
				listMap.add(newMap) ;
			}
		return JSONArray.fromObject(listMap) ;
	}
}
