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

import com.creidtsys.apps.manage.entity.PaperRelation;
import com.creidtsys.apps.manage.entity.ResultDetial;
import com.creidtsys.apps.manage.service.PaperRelationService;
import com.creidtsys.apps.manage.service.ResultDetialService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.UtilTools;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("resultDetial")
public class ResultDetialController {
	@Resource
	private ResultDetialService resultDetialService ;
	@Resource
	private PaperRelationService paperRelationService ;
	private static ObjectMapper mapper = new ObjectMapper();

	@RequestMapping(value="/initPaperInfo",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String,Object>  initPaperInfo(String data) throws JsonParseException, JsonMappingException, IOException{
		Map<String,String> map= mapper.readValue(data, new TypeReference<Map<String,String>>() { 
		 });
		//判断后是否已经存储
		List<ResultDetial> ifContain = resultDetialService.ifContain(map.get("resultId"));
		if(ifContain.size()<=0){
			List<PaperRelation> list = paperRelationService.selectByOtherId(map.get("otherId"));
			for(int i = 0 ;i<list.size();i++){
				ResultDetial resultDetial = new ResultDetial() ;
				resultDetial.setRdId(UtilTools.getNum19());
				resultDetial.setRdInfoId(map.get("resultId"));
				resultDetial.setPrId(list.get(i).getPrId());
				resultDetial.setPrPid(list.get(i).getPrPid());
				resultDetial.setPrName(list.get(i).getPrName());
				resultDetial.setType(list.get(i).getType());
				resultDetial.setOtherId(list.get(i).getOtherId());
				resultDetial.setUserLoginName(map.get("userNo"));
				resultDetial.setRdIndex(list.get(i).getPrIndex());
				resultDetial.setDetialCore(list.get(i).getPrScore());
				resultDetialService.add(resultDetial) ;
			}
			ifContain = resultDetialService.ifContain(map.get("resultId"));
		}
		Map<String,Object> maps = new HashMap<String, Object>();
		maps.put("rows", ifContain) ;
		return maps ;
	}
	
	@RequestMapping(value="/editDetial",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage editDetial(String data) throws Exception{
		 ResultDetial resultDetial= mapper.readValue(data, new TypeReference<ResultDetial>() { 
		 });
		 resultDetialService.editDetial(resultDetial);
		return new JsonMessage().success() ;
	}
}
