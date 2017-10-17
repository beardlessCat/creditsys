package com.creidtsys.apps.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.manage.entity.PaperRelation;
import com.creidtsys.apps.manage.service.PaperRelationService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value="/paperRelation")
public class PaperRelationController {
	
	@Resource
	private PaperRelationService paperRelationService ;
	private final String TOADD = "jsp//manage/paperRelation/add" ;
	private final String TOLISTPAPERDETIAL="jsp/manage/paperRelation/listPaperDetial";
	private final String TOEDIT="jsp/manage/paperRelation/edit" ;
	private final String TOCHOOSEPOINT="jsp/manage/paperRelation/listPoint";
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping(value="/toEditJsp")
	public String toEdit(){
		return  TOEDIT ;
	}
	@RequestMapping("/toChoosePoint")
	public String toChoosePoint(){
		return TOCHOOSEPOINT ;
	}
	@RequestMapping(value="/toListPaperDetial")
	public String toPaperDetialList(){
		return TOLISTPAPERDETIAL;
	}
	@RequestMapping(value="/toAdd")
	public  String toAdd(){
		return TOADD ;
	}
	@RequestMapping(value="/paperRelation" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public Map<String,Object> getData(String  paperName){
		List<PaperRelation> list= paperRelationService.getTreeGrid(paperName);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
	@RequestMapping(value="/add",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage addPaperRelation(String data) throws Exception{
		 PaperRelation paperRelation= mapper.readValue(data, new TypeReference<PaperRelation>() { 
		 });
		 paperRelation.setPrId(UtilTools.getNum19());
		 paperRelationService.addRelation(paperRelation);
		return new JsonMessage().success();
	}
	 @RequestMapping(value="del",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public JsonMessage deletePosition(String prId) throws Exception{
		 paperRelationService.deletePosition(prId) ;
		 return new JsonMessage().success() ;
    }
	 @RequestMapping(value="getRealtionById",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public JsonMessage getRealtionById(String prId){
		 PaperRelation paperRelation = paperRelationService.getRealtionById(prId);
		 return new JsonMessage().success(paperRelation);
	 }
	@RequestMapping(value="/edit",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage editPaperRelation(String data) throws Exception{
		 PaperRelation paperRelation= mapper.readValue(data, new TypeReference<PaperRelation>() { 
		 });
		 paperRelationService.editRelation(paperRelation);
		return new JsonMessage().success();
	}
}
