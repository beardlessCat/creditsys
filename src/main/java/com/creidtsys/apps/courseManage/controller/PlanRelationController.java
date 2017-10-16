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
import cn.sys.courseManage.entity.Major;
import cn.sys.courseManage.entity.PlanRelation;
import cn.sys.courseManage.service.MajorService;
import cn.sys.courseManage.service.PlanRelationService;
import cn.sys.utils.UtilTools;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/planRelation")
public class PlanRelationController {
	@Resource
	private PlanRelationService planRelationService ;
	@Resource
	private MajorService majorService;
	private String LISTTREE ="courseManager/planRelation/listTree";
	private String LISTTYPE="courseManager/planRelation/listType";
	private String LISTCOURSE = "courseManager/planRelation/listCourse";
	private String LISTDIRECT ="courseManager/planRelation/listDirect";
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping("/chooseCourse")
	private String chooseCourse(){
		return LISTCOURSE ;
	}
	@RequestMapping("/chooseDirect")
	private String chooseDirect(){
		return LISTDIRECT;
	}
	@RequestMapping("/chooseCourseType")
	private String chooseCourseType(){
		return LISTTYPE;
	}
	@RequestMapping("/listTree")
	private String listTree(){
		return LISTTREE ;
	}
	@RequestMapping(value="/treeData" )
    @ResponseBody
	public Map<String,Object> getData(String otherId){
		List<PlanRelation> list= planRelationService.getTreeGrid(otherId);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", list.size());
		map.put("rows", list);
		return map;
	}
	@RequestMapping(value="/addP" )
    @ResponseBody
	public JsonMessage addP(String data) throws Exception{
		Major  major = mapper.readValue(data, new TypeReference<Major>() { });
		PlanRelation planRelation = new  PlanRelation();
		planRelation.setPrId(UtilTools.getNum19());
		planRelation.setPrPid("0");
		planRelation.setPrType("1");
		planRelation.setPrName(major.getMajorName()+"��ѧ�ƻ�");
		planRelation.setMajorId(major.getMajorId());
		planRelation.setPrDegree("1");
		planRelationService.add(planRelation);
		return new JsonMessage().success();
	}
	@RequestMapping(value="/oneData" )
    @ResponseBody
	public Map<String,Object> oneData(String majorId){
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		String userId = userDetails.getPassword();
	//	String majorIds = majorService.getidByUserId(userId);
		List<PlanRelation> list= planRelationService.oneData(majorId);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", list.size());
		map.put("rows", list);
		return map;
	}
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage add(String data) throws JsonParseException, JsonMappingException, IOException{
		 PlanRelation  planRelation = mapper.readValue(data, new TypeReference<PlanRelation>() { });
		 Boolean b = planRelationService.checkExists(planRelation);
		 if(!b){
			 planRelation.setPrId(UtilTools.getNum19());
			 planRelationService.add(planRelation); 
		 }
		return new JsonMessage().success();
	}
	@RequestMapping(value="/addCourse" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addCourse(String data) throws JsonParseException, JsonMappingException, IOException{
		 PlanRelation  planRelation = mapper.readValue(data, new TypeReference<PlanRelation>() { });
		 Boolean b = planRelationService.checkExists(planRelation);
		 if(!b){
			 planRelation.setPrId(UtilTools.getNum19());
			 planRelationService.addCourse(planRelation); 
		 }
		return new JsonMessage().success();
	}
	@RequestMapping(value="/delete",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage deleteType(String prId){
		planRelationService.deleteType(prId);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/edit" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage edit(String data) throws JsonParseException, JsonMappingException, IOException{
		 PlanRelation  planRelation = mapper.readValue(data, new TypeReference<PlanRelation>() { });
		 planRelationService.edit(planRelation);
		return new JsonMessage().success();
	}
	@RequestMapping(value="/initDirect",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JSONArray initDirect() throws Exception{
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication() .getPrincipal();
		String userId = userDetails.getPassword();
		String majorId = majorService.getidByUserId(userId);
		List<PlanRelation> list = planRelationService.getAllDirect(majorId); 
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getPrId()) ;
				newMap.put("text", list.get(i).getPrName());
				listMap.add(newMap) ;
			}
		return JSONArray.fromObject(listMap) ;
	}
}
