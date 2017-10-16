package com.creidtsys.apps.manage.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.manage.entity.PaperDetial;
import com.creidtsys.apps.manage.entity.PaperRelation;
import com.creidtsys.apps.manage.service.PaperDetialService;
import com.creidtsys.apps.manage.service.PaperRelationService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
@RequestMapping(value="/paperDetial")
public class PaperDetialController {
	@Resource
	private PaperDetialService paperDetialService  ;
	@Resource
	private PaperRelationService paperRelationService ;
	private final String  LIST ="manage/paperDetial/list" ;
	private final String TONEWJSP = "manage/paperDetial/add" ;
	private final String TOEDITJSP ="manage/paperDetial/edit" ;
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping("/list")
	public String list(){
		return LIST ;
	}
    @RequestMapping("/toNew")
    public String toNew(){
    	return TONEWJSP ;
    }
    @RequestMapping("/toEdit")
    public String toEdit(){
    	return TOEDITJSP ;
    }
    
    @RequestMapping(value="/allData",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage queryData(){
		List<PaperDetial> list = paperDetialService.findAll();
		return new JsonMessage().success(list);
	}
    @RequestMapping(value="/delete",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage deleteCompany(String detialId){
		paperDetialService.deleteDetial(detialId);
		//根据otherId删除关系表中的题目信息
		paperRelationService.deleteByOtherId(detialId);
		return new JsonMessage().success() ;
	}
    @RequestMapping(value="/add",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage addCompany(String data) throws Exception{
		 PaperDetial paperDetial= mapper.readValue(data, new TypeReference<PaperDetial>() { 
		 });
		 paperDetial.setDetialId(UtilTools.getNum19().toUpperCase());
		 paperDetialService.add(paperDetial);
		return new JsonMessage().success() ;
	}
    @RequestMapping(value="/edit",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage editDetial(String data) throws Exception{
    	PaperDetial paperDetial= mapper.readValue(data, new TypeReference<PaperDetial>() { 
		 });
		 paperDetialService.editCompany(paperDetial);
		 PaperRelation paperRelation = new PaperRelation();
		 paperRelation.setOtherId(paperDetial.getDetialId());
		 paperRelation.setPrDesc(paperDetial.getDetialDesc());
		 paperRelation.setPrHard(paperDetial.getDetialDegree());
		 paperRelation.setPrName(paperDetial.getDetialName());
		 paperRelation.setPrRate(paperDetial.getDetialRate());
		 paperRelation.setPrScore(paperDetial.getDetialResult());
		 paperRelation.setPrType(paperDetial.getDetialType());
		 //根据otherId修改关系表中的题目信息
		 paperRelationService.eidtByOtherId(paperRelation);
		return new JsonMessage().success() ;
	}
}


