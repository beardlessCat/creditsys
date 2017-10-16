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

import com.creidtsys.apps.courseManage.entity.CultivateScheme;
import com.creidtsys.apps.courseManage.entity.Major;
import com.creidtsys.apps.courseManage.service.CultivateSchemeService;
import com.creidtsys.apps.courseManage.service.MajorService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/cultivateScheme")
public class CultivateSchemeController {
	
	@Resource
	private CultivateSchemeService cultivateSchemeService;
	@Resource
	private MajorService majorService;
	
	private final String LIST ="courseManager/cultivateScheme/list" ;
	private final String TONEWJSP = "courseManager/cultivateScheme/add" ;
	private final String TOEDITJSP ="courseManager/cultivateScheme/edit" ;
	private final String TONESmajor ="courseManager/cultivateScheme/nescultivateScheme";
	private final String TOMADIR = "courseManager/major/listMaDir";
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping("/toMaDir")
	public String toMaDir(){
		return TOMADIR ;
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
	
	@RequestMapping(value="/allCultivateScheme",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage allCultivateScheme(String majorId){
		List<CultivateScheme> list = cultivateSchemeService.selectAll(majorId);
		return new JsonMessage().success(list) ;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	private JsonMessage delete(String cultivateId){
		cultivateSchemeService.deleteCultivate(cultivateId);
		return new JsonMessage().success() ;
	}
	
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addMajor(String data) throws JsonParseException, JsonMappingException, IOException{
		CultivateScheme cultivateScheme = mapper.readValue(data, new TypeReference<CultivateScheme>() { });
		cultivateScheme.setCultivateId(UtilTools.getNum19());
		cultivateSchemeService.addCultivate(cultivateScheme);
		return new JsonMessage().success(cultivateScheme.getMajorId());
	}
	
	@RequestMapping(value="/edit" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage editCourse(String data) throws JsonParseException, JsonMappingException, IOException{
		CultivateScheme cultivateScheme = mapper.readValue(data, new TypeReference<CultivateScheme>() { });
		cultivateSchemeService.editCultivate(cultivateScheme);
		return new JsonMessage().success(cultivateScheme.getCultivateId());
	}
	
	@RequestMapping(value="/initMajor" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String,String>> initMajor(String majorId)
	{
		List<Major> majors=majorService.selectAll(majorId);
		
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();
		for(int i=0;i<majors.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", majors.get(i).getMajorId()) ;
				newMap.put("text", majors.get(i).getMajorName());
				listMap.add(newMap) ;
			}
		return listMap ;
	}
}
