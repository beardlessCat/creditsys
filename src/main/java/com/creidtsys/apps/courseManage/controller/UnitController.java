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

import com.creidtsys.apps.courseManage.entity.CourseRelation;
import com.creidtsys.apps.courseManage.entity.Unit;
import com.creidtsys.apps.courseManage.service.CourseRelationService;
import com.creidtsys.apps.courseManage.service.UnitService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/unit")
public class UnitController {
	@Resource
	private UnitService unitService ;
	@Resource
	private CourseRelationService  courseRelationService;
	private final String  LIST ="jsp/courseManager/unit/list" ;
	private final String TONEWJSP = "jsp/courseManager/unit/add" ;
	private final String TOEDITJSP ="jsp/courseManager/unit/edit" ;
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
	@RequestMapping(value="/allUnit",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage allUnit(String unitName){
		List<Unit> list= unitService.getAll(unitName);
		return new JsonMessage().success(list);
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage delete(String unitId){
		unitService.deleteCourse(unitId);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addUnit(String data) throws JsonParseException, JsonMappingException, IOException{
		Unit unit = mapper.readValue(data, new TypeReference<Unit>() { });
		unit.setUnitId(UtilTools.getNum19());
		unitService.addUnit(unit);
		
		/*CourseRelation courseRelation = new CourseRelation();
		CourseRelation pCourseRelation = courseRelationService.findByOtherId(unit.getUnCourseId()).get(0);
		courseRelation.setSrId(UtilTools.getNum19());
		courseRelation.setSrPid(pCourseRelation.getSrId());
		courseRelation.setSrType("2");
		courseRelation.setSrName(unit.getUnitName());
		courseRelation.setSrOtherId(unit.getUnitId());
		courseRelation.setSrRemake(unit.getUnitRemake());
		courseRelationService.addRela(courseRelation);*/
		return new JsonMessage().success();
	}
	@RequestMapping(value="/edit" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage editUnit(String data) throws JsonParseException, JsonMappingException, IOException{
		Unit unit = mapper.readValue(data, new TypeReference<Unit>() { });
		unitService.editUnit(unit);
		CourseRelation courseRelation = new CourseRelation() ;
		courseRelation.setSrName(unit.getUnitName());
		courseRelation.setSrRemake(unit.getUnitRemake());
		courseRelation.setSrOtherId(unit.getUnitId());
		courseRelationService.editByOtherId(courseRelation);
		return new JsonMessage().success();
	}
	@RequestMapping(value="/initUnit",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String,String>>  initCourse(String courseId) throws Exception{
		List<Unit> list =  unitService.getAll(courseId); 
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getUnitId()) ;
				newMap.put("text", list.get(i).getUnitName());
				listMap.add(newMap) ;
			}
		return listMap ;
	}
}
