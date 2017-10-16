package com.creidtsys.apps.courseManage.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.xml.resolver.apps.resolver;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sys.auth.utils.JsonMessage;
import cn.sys.courseManage.entity.CourseDepend;
import cn.sys.courseManage.service.CourseDependService;
import cn.sys.utils.UtilTools;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/courseDepend") 
public class CourseDependController {
	@Resource
	private CourseDependService courseDependService ;
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addCourseDepend(String data) throws Exception{
		CourseDepend courseDepend = mapper.readValue(data, new TypeReference<CourseDepend>() { });
		courseDepend.setDependId(UtilTools.getNum19());
		courseDependService.add(courseDepend);
		return new JsonMessage().success();
	}
	public JsonMessage editCourseDepend(String data) throws Exception{
		CourseDepend courseDepend = mapper.readValue(data, new TypeReference<CourseDepend>() { });
		courseDependService.edit(courseDepend);
		return new JsonMessage().success();
	}
	@RequestMapping(value="/getAll",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage getAll(String courseSid){
		List<CourseDepend> list =courseDependService.getBySid(courseSid) ;
		return new JsonMessage().success(list);
	}
	@RequestMapping(value="/editChecked",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage editChecked(String dependIds){
		String []arr=dependIds.split(",");
		for(int i = 0;i<arr.length;i++){
			courseDependService.editChecked(arr[i]);
		}
		return new JsonMessage().success();
	}
	@RequestMapping(value="/getPid",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage getPid(String courseSid){
		List<CourseDepend> list = courseDependService.getBySid(courseSid);
		return new JsonMessage().success(list) ;
	}
}
