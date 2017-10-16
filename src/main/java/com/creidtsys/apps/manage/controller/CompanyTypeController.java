package com.creidtsys.apps.manage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.manage.entity.CompanyType;
import com.creidtsys.apps.manage.service.CompanyTypeService;
import com.creidtsys.utils.JsonMessage;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/companyType")
public class CompanyTypeController {
	@Resource
	private CompanyTypeService companyTypeService ;
	private final String  LIST ="manage/companyType/list" ;
	private final String TONEWJSP = "manage/companyType/add" ;
	private final String TOEDITJSP ="manage/companyType/edit" ;
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping("/list")
	private String toList(){
		return LIST ;
	}
	@RequestMapping("/toAdd")
	private String toNew(){
		return TONEWJSP ;
	}
	@RequestMapping("/toEdit")
	private String toEdit(){
		return TOEDITJSP ;
	}
	@RequestMapping(value="/allType",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage allType(){
		List<CompanyType> list = companyTypeService.getAll(); 
		return new JsonMessage().success(list) ;
	}
	@RequestMapping(value="/allByCon",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage allByCon(String typeName){
		List<CompanyType> list = companyTypeService.allByCon(typeName); 
		return new JsonMessage().success(list) ;
	}
	@RequestMapping(value="/add",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage addType(String data) throws Exception{
		CompanyType companyType = mapper.readValue(data, new TypeReference<CompanyType>() { });
		companyType.setTypeId(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
		companyTypeService.addType(companyType);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/edit",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage editType(String data) throws Exception{
		CompanyType companyType = mapper.readValue(data, new TypeReference<CompanyType>() { });
		companyTypeService.editType(companyType);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/delete",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage deleteType(String typeId){
		companyTypeService.deleteType(typeId);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/initType",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String,String>>  initType() throws Exception{
		List<CompanyType> list = companyTypeService.getAll(); 
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getTypeId()) ;
				newMap.put("text", list.get(i).getTypeName());
				listMap.add(newMap) ;
			}
		return listMap ;
	}
}
