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
import com.creidtsys.apps.courseManage.entity.CourseDepend;
import com.creidtsys.apps.courseManage.entity.CourseRelation;
import com.creidtsys.apps.courseManage.service.CourseDependService;
import com.creidtsys.apps.courseManage.service.CourseRelationService;
import com.creidtsys.apps.courseManage.service.CourseService;
import com.creidtsys.apps.manage.entity.ResultInfo;
import com.creidtsys.apps.manage.service.ResultInfoService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;

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
	private final String  LIST ="jsp/courseManager/course/list" ;
	private final String TONEWJSP = "jsp/courseManager/course/add" ;
	private final String TOEDITJSP ="jsp/courseManager/course/edit" ;
	private final String TONESCOURSE ="jsp/courseManager/course/nesCourse";
	private final String PROGRESS ="jsp/courseManager/course/learnProgess";
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
	private Map<String,Object> allCourse(String data) throws JsonParseException, JsonMappingException, IOException{
		Course course= mapper.readValue(data, new TypeReference<Course>() { 
		 });
	    int page = Integer.parseInt(course.getPageNumber()) ;  
        int rows =Integer.parseInt(course.getPageSize()) ;   
		List<Course> list = courseService.selectAll(course.getPids());
		Map<String,Object> map =new HashMap<String, Object>() ;
		map.put("total", list.size()) ;
		PageHelper.startPage(page,rows);
		List<Course> listPage = courseService.selectAll(course.getPids());  
		map.put("rows", listPage) ;
		return map ;
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
	public List<Map<String,String>> initCourse(String majorId) throws Exception{
		List<Course> list =  courseService.selectAll(majorId); 
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getCourseId()) ;
				newMap.put("text", list.get(i).getCourseName());
				listMap.add(newMap) ;
			}
		return listMap ;
	}
	@RequestMapping(value="/getChoose",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage getChoose(){
		ResultInfo resultInfo = new ResultInfo();
	//	UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		//获取用户id以判断是否已经对课程选择，判断条件用户与对应的课程的成绩中是否有数据
		String userId = "" ;//userDetails.getPassword() ;
		resultInfo.setRiUserId(userId);
		List<ResultInfo> list = resultInfoService.getChoose(resultInfo) ;
		return new JsonMessage().success(list) ;
	}
}
