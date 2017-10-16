package com.creidtsys.apps.courseManage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sys.auth.utils.JsonMessage;
import cn.sys.courseManage.entity.Course;
import cn.sys.courseManage.entity.CourseDepend;
import cn.sys.courseManage.entity.CourseRelation;
import cn.sys.courseManage.service.CourseDependService;
import cn.sys.courseManage.service.CourseRelationService;
import cn.sys.courseManage.service.CourseService;
import cn.sys.manage.entity.ResultInfo;
import cn.sys.manage.service.ResultInfoService;
import cn.sys.utils.UtilTools;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/course")
public class CourseController {
	@Resource
	private CourseService courseService ;
	@Resource
	private CourseDependService courseDependService;
	@Resource
	private CourseRelationService courseRelationService ;
	@Resource
	private ResultInfoService resultInfoService ;
	private final String  LIST ="courseManager/course/list" ;
	private final String TONEWJSP = "courseManager/course/add" ;
	private final String TOEDITJSP ="courseManager/course/edit" ;
	private final String TONESCOURSE ="courseManager/course/nesCourse";
	private final String PROGRESS ="courseManager/course/learnProgess";
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping("/learnProgess")
	public String progress(){
		return PROGRESS ;
	}
	@RequestMapping("/toNesCourse")
	public String toNesCourse(){
		return TONESCOURSE ;
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
	
	@RequestMapping(value="/allCourse",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage allCourse(String majorId){
		List<Course> list = courseService.selectAll(majorId);
		return new JsonMessage().success(list) ;
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage delete(String courseId){
		courseService.deleteCourse(courseId);
		//删除关系表中的课程
		courseDependService.deleteByCourseSid(courseId);
		//删除关系表中的课程
		courseRelationService.deleteByOtherId(courseId);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addCours(String data) throws JsonParseException, JsonMappingException, IOException{
		Course course = mapper.readValue(data, new TypeReference<Course>() { });
		String ids = course.getPids() ;
		String [] arr = ids.split(",") ;
		course.setCourseId(UtilTools.getNum19());
		courseService.addCourse(course);
		//添加到课程关系表
		CourseRelation courseRelation = new CourseRelation() ;
		courseRelation.setSrPid("0");
		courseRelation.setSrId(UtilTools.getNum19());
		courseRelation.setSrName(course.getCourseName());
		courseRelation.setSrType("1");
		courseRelation.setSrDate(course.getCoursePeriod());
		courseRelation.setSrIsNess(course.getCourseRequire());
		courseRelation.setSrProperty(course.getCourseProperty());
		courseRelation.setSrOtherId(course.getCourseId());
		courseRelationService.addRela(courseRelation);
		if(!"".endsWith(ids)){
			for(int i=0;i<arr.length;i++){
				CourseDepend courseDepend = new CourseDepend() ;
				courseDepend.setDependId(UtilTools.getNum19());
				courseDepend.setCoursePid(arr[i]);
				courseDepend.setCourseSid(course.getCourseId());
				courseDepend.setMajorId("11111");
				Course newCourse = courseService.getById(arr[i]);
				courseDepend.setCoursePname(newCourse.getCourseName());
				courseDepend.setCourseName(course.getCourseName());
				courseDepend.setIsNes("checked");
				courseDependService.add(courseDepend);
			}
			//当课程以来为空时
		}else{
			CourseDepend courseDepend = new CourseDepend() ;
			courseDepend.setDependId(UtilTools.getNum19());
			courseDepend.setCoursePid("0");
			courseDepend.setCourseSid(course.getCourseId());
			courseDepend.setMajorId("11111");
			courseDepend.setCoursePname("0");
			courseDepend.setCourseName(course.getCourseName());
			courseDepend.setIsNes("checked");
			courseDependService.add(courseDepend);
		}
		return new JsonMessage().success(course.getCourseId());
	}
	@RequestMapping(value="/edit" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage editCourse(String data) throws JsonParseException, JsonMappingException, IOException{
		Course course = mapper.readValue(data, new TypeReference<Course>() { });
		String ids = course.getPids() ;
		String [] arr = ids.split(",") ;
		courseService.editCourse(course);
		courseDependService.deleteByCourseSid(course.getCourseId());
		if(!"".equals(ids)){
			for(int i=0;i<arr.length;i++){
				//根基courseId进行删除，再添加
				CourseDepend courseDepend = new CourseDepend() ;
				courseDepend.setDependId(UtilTools.getNum19());
				courseDepend.setCoursePid(arr[i]);
				courseDepend.setCourseSid(course.getCourseId());
				courseDepend.setMajorId("11111");
				Course newCourse = courseService.getById(arr[i]);
				courseDepend.setCoursePname(newCourse.getCourseName());
				courseDepend.setCourseName(course.getCourseName());
				courseDepend.setIsNes("checked");
				courseDependService.add(courseDepend);  
			}
		}else{
			CourseDepend courseDepend = new CourseDepend() ;
			courseDepend.setDependId(UtilTools.getNum19());
			courseDepend.setCoursePid("0");
			courseDepend.setCourseSid(course.getCourseId());
			courseDepend.setMajorId("11111");
			courseDepend.setCoursePname("0");
			courseDepend.setCourseName(course.getCourseName());
			courseDepend.setIsNes("checked");
			courseDependService.add(courseDepend);
		}
		CourseRelation courseRelation = new CourseRelation() ;
		courseRelation.setSrName(course.getCourseName());
		courseRelation.setSrDate(course.getCoursePeriod());
		courseRelation.setSrIsNess(course.getCourseRequire());
		courseRelation.setSrProperty(course.getCourseProperty());
		courseRelation.setSrOtherId(course.getCourseId());
		courseRelationService.editByOtherId(courseRelation);
		return new JsonMessage().success(course.getCourseId());
	}
	
	@RequestMapping(value="/initCourse",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JSONArray initCourse(String majorId) throws Exception{
		List<Course> list =  courseService.selectAll(majorId); 
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getCourseId()) ;
				newMap.put("text", list.get(i).getCourseName());
				listMap.add(newMap) ;
			}
		return JSONArray.fromObject(listMap) ;
	}
	@RequestMapping(value="/getChoose",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage getChoose(){
		ResultInfo resultInfo = new ResultInfo();
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		//获取用户id以判断是否已经对课程选择，判断条件用户与对应的课程的成绩中是否有数据
		String userId = userDetails.getPassword() ;
		resultInfo.setRiUserId(userId);
		List<ResultInfo> list = resultInfoService.getChoose(resultInfo) ;
		return new JsonMessage().success(list) ;
	}
}
