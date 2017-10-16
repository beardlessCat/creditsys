package com.creidtsys.apps.manage.controller;

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

import com.creidtsys.apps.manage.entity.Paper;
import com.creidtsys.apps.manage.entity.PaperRelation;
import com.creidtsys.apps.manage.service.PaperRelationService;
import com.creidtsys.apps.manage.service.PaperService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value="/paper")
public class PaperController {
	@Resource
	private PaperService paperService ;
	@Resource
	private PaperRelationService paperRelationService ; 
	private final String  LIST ="manage/paper/list" ;
	private final String TONEWJSP = "manage/paper/add" ;
	private final String TOEDITJSP ="manage/paper/edit" ;
	private final String TOEDITINFO ="manage/paper/listRelation";
	private static ObjectMapper mapper = new ObjectMapper();
	@RequestMapping(value="/toEditInfo")
	public String toEditInfo(){
		return TOEDITINFO ;
	}
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
    @RequestMapping(value="/getAll",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    private JsonMessage allPaper(){
    	List<Paper> list = paperService.getAll() ;
    	return new JsonMessage().success(list) ;
    }
    @RequestMapping(value="/delete",method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    private JsonMessage delPaper(String paperId){
    	paperService.delPaper(paperId) ;
    	//根据otherId删除关系表中的信息
    	paperRelationService.deleteByOtherId(paperId);
    	return new JsonMessage().success() ;
    }
    @RequestMapping(value="/add",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage addPaper(String data) throws Exception{
		 Paper paper= mapper.readValue(data, new TypeReference<Paper>() { 
		 });
		 paper.setPaperId(UtilTools.getNum19());
		 paperService.addPaper(paper);
		 PaperRelation paperRelation = new PaperRelation() ;
		 paperRelation.setPrId(UtilTools.getNum19());
		 paperRelation.setPrName(paper.getPaperName());
		 paperRelation.setType("1");
		 paperRelation.setPrPid("0");
		 paperRelation.setOtherId(paper.getPaperId());
		 paperRelationService.addRelation(paperRelation);
		return new JsonMessage().success() ;
	}
    @RequestMapping(value="/edit",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage editPaper(String data) throws Exception{
		 Paper paper= mapper.readValue(data, new TypeReference<Paper>() { 
		 });
		 paperService.editPaper(paper);
		 //根据otherId修改关系表中试卷信息
		 PaperRelation paperRelation = new PaperRelation() ;
		 paperRelation.setPrName(paper.getPaperName());
		 paperRelation.setOtherId(paper.getPaperId());
		 paperRelationService.eidtByOtherId(paperRelation);
		return new JsonMessage().success() ;
	}
    @RequestMapping(value="/initCobbobox",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String,String>>  initType() throws Exception{
		List<Paper> list = paperService.getAll(); 
		List<Map<String,String>> listMap = new ArrayList<Map<String,String>>();;
		for(int i=0;i<list.size();i++){
			Map<String,String> newMap = new HashMap<String, String>() ;
				newMap.put("id", list.get(i).getPaperId()) ;
				newMap.put("text", list.get(i).getPaperName());
				listMap.add(newMap) ;
			}
		return listMap;
	}
}
