package com.creidtsys.apps.courseManage.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.courseManage.entity.CourseRelation;
import com.creidtsys.apps.courseManage.entity.Point;
import com.creidtsys.apps.courseManage.service.CourseRelationService;
import com.creidtsys.apps.courseManage.service.PointService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/point")
public class PointController {
	@Resource
	private PointService pointService ;
	@Resource
	private CourseRelationService  courseRelationService;
	private final String  LIST ="courseManager/point/list" ;
	private final String TONEWJSP = "courseManager/point/add" ;
	private final String TOEDITJSP ="courseManager/point/edit" ;
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
	@RequestMapping(value="/allPoint",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage allPoint(String unitId){
		List<Point> list = pointService.getAll(unitId);
		return new JsonMessage().success(list);
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage delete(String pointId){
		pointService.deletePoint(pointId);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addCours(String data) throws JsonParseException, JsonMappingException, IOException{
		Point point = mapper.readValue(data, new TypeReference<Point>() { });
		point.setPointId(UtilTools.getNum19());
		pointService.addCourse(point);
		/*CourseRelation courseRelation = new CourseRelation();
		CourseRelation pCourseRelation = courseRelationService.findByOtherId(point.getPointUnitId()).get(0);
		courseRelation.setSrId(UtilTools.getNum19());
		courseRelation.setSrPid(pCourseRelation.getSrId());
		courseRelation.setSrType("3");
		courseRelation.setSrName(point.getPointName());
		courseRelation.setSrOtherId(point.getPointId());
		courseRelation.setSrRemake(point.getPointRemake());
		courseRelationService.addRela(courseRelation);*/
		return new JsonMessage().success();
	}
	@RequestMapping(value="/edit" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage editUnit(String data) throws JsonParseException, JsonMappingException, IOException{
		Point point = mapper.readValue(data, new TypeReference<Point>() { });
		pointService.editUnit(point);
		CourseRelation courseRelation = new CourseRelation() ;
		courseRelation.setSrName(point.getPointName());
		courseRelation.setSrRemake(point.getPointRemake());
		courseRelation.setSrOtherId(point.getPointId());
		courseRelationService.editByOtherId(courseRelation);
		return new JsonMessage().success();
	}
}
