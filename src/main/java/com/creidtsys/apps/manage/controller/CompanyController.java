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

import com.creidtsys.apps.manage.entity.Company;
import com.creidtsys.apps.manage.service.CompanyService;
import com.creidtsys.utils.JsonMessage;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/company")
public class CompanyController  {
	@Resource
	private CompanyService companyService ;
	private final String  LIST ="manage/company/list" ;
	private final String TEST = "manage/company/ueditor" ;
	private final String TONEWJSP = "manage/company/add" ;
	private final String TOEDITJSP ="manage/company/edit" ;
	private final String LISTTREE ="manage/company/listTree" ;
	private final String TOSHOWJSP ="manage/company/show";
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping(value="/listTree")
	public String listTree(){
		return LISTTREE ;	
	}
	@RequestMapping(value="/list")
	public String list(){
		return LIST ;
	}
	@RequestMapping(value="/toEdit")
	public String toEdit(){
		return TOEDITJSP ;
	}
	@RequestMapping(value="/ueditor")
	public String ueditor(){
		return TEST ;
	}
	@RequestMapping(value="/showCompanyInfo")
	public String show(){
		return TOSHOWJSP ;
	}
	@RequestMapping(value="/toAdd")
	public String toAdd(){
		return TONEWJSP ;
	}
	@RequestMapping(value="/allCompany",method = RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public Map<String,Object> queryAllDep(String companyName){
		List<Company> list = companyService.findAll(companyName);
		Map<String,Object> map =new HashMap<String, Object>() ;
		map.put("total", list.size()) ;
		map.put("rows", list) ;
		return map ;
	}
	@RequestMapping(value="/selectByCon",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public Map<String,Object> selectByCon(String data) throws Exception{
		Company company= mapper.readValue(data, new TypeReference<Company>() { 
		 });
		List<Company> list = companyService.selectByCon(company);
		Map<String,Object> map =new HashMap<String, Object>() ;
		map.put("total", list.size()) ;
		map.put("rows", list) ;
		return map ;
	}
	@RequestMapping(value="/add",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage addCompany(String data) throws Exception{
		 Company company= mapper.readValue(data, new TypeReference<Company>() { 
		 });
		 company.setCompanyId(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
		 companyService.add(company);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/delete",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage deleteCompany(String companyId){
		companyService.deleteCompany(companyId);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/edit",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage editCompany(String data) throws Exception{
		 Company company= mapper.readValue(data, new TypeReference<Company>() { 
		 });
		companyService.editCompany(company);
		return new JsonMessage().success() ;
	}
	@RequestMapping(value="/treeData",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public Map<String,Object> treeData( ){
		List<Company> list = companyService.findAll("");
		Map<String,Object> map =new HashMap<String, Object>() ;
		map.put("rows", list);
		return map ;
	}
	@RequestMapping(value="/initCompany",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String,String>>  initType() throws Exception{
		List<Company> list = companyService.findAll(""); 
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getCompanyId()) ;
				newMap.put("text", list.get(i).getCompanyName());
				listMap.add(newMap) ;
			}
		return listMap ;
	}
}
