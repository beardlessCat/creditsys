package com.creidtsys.apps.manage.controller;

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

import com.creidtsys.apps.manage.entity.Relation;
import com.creidtsys.apps.manage.service.RelationService;
import com.creidtsys.apps.manage.service.TestTreeGridService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/relation")
public class RelationController {
	@Resource
	private RelationService relationService ; 
	@Resource
	private TestTreeGridService gridService ;
	private final String LISTTREE="manage/relation/listTree" ;
	private final String ADDCOMPANY="manage/relation/addCompany" ;
	private final String ADDPOSITION="manage/relation/listPosition" ;
	private final String ADDPOINT="manage/relation/listPoint" ;
	private final String ADDTECHNOLOGY="manage/relation/listTechnology" ;
	private final String TOCHOOSECOMPANY="manage/relation/listCompany";
	private final String TOEDITJSP="manage/relation/edit";
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping(value="/toEditJsp")
	private String toEdit(){
		return TOEDITJSP ;
	}
	@RequestMapping(value="/toAddCompany")
	private String toAddCompany(){
		return TOCHOOSECOMPANY ;
	}
	@RequestMapping(value="/listTree")
	private String listTree(){
		return LISTTREE ;
	}
	@RequestMapping(value="/addCompany")
	private String addsCompany(){
		return ADDCOMPANY;
	}
	@RequestMapping(value="/addPosition")
	private String addPosition(){
		return ADDPOSITION ;
	}
	@RequestMapping(value="/addPoint")
	private String addPoint(){
		return ADDPOINT ;
	}
	@RequestMapping(value="/addTechnology")
	private String addTechnology(){
		return ADDTECHNOLOGY ;
	}
	@RequestMapping(value="/treeData" )
    @ResponseBody
	public Map<String,Object> getData(){
		List<Relation> list= relationService.getTreeGrid();
	/*	List<TestTreeGrid> list = gridService.selectList();*/
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", list.size());
		map.put("rows", list);
		return map;
	}
	@RequestMapping(value="/relationTree",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage getTree(){
		List<Relation> list = relationService.getTree();
		return new JsonMessage().success(list);
	}
	@RequestMapping(value="/treeList",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE )
    @ResponseBody
	public Map<String,Object> treeList(String companyId){
		List<Relation> list= relationService.getTreeList(companyId);
	/*	List<TestTreeGrid> list = gridService.selectList();*/
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", list.size());
		map.put("rows", list);
		return map;
	}
	@RequestMapping(value="/addCompanys" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage addCompany(String data) throws JsonParseException, JsonMappingException, IOException{
		Relation relation= mapper.readValue(data, new TypeReference<Relation>() { 
		 });
		relation.setRelationId(UtilTools.getNum19());
		relationService.add(relation);
		return new JsonMessage().success();
	}
	@RequestMapping(value="/del" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage delRealtion(String relationId) {
		relationService.del(relationId);
		return new JsonMessage().success();
	}
	@RequestMapping(value="/getRealtionById" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage getRealtionById(String relationId){
		Relation relation = relationService.getById(relationId) ;
		return new JsonMessage().success(relation) ;
	}
	@RequestMapping(value="/editRealtion" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage edit(String data) throws JsonParseException, JsonMappingException, IOException{
		Relation relation= mapper.readValue(data, new TypeReference<Relation>() { 
		 });
		 relationService.edit(relation) ;
		return new JsonMessage().success() ;
	}
}
