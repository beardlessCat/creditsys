package com.creidtsys.apps.auth.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.auth.entity.SysRoleRes;
import com.creidtsys.apps.auth.service.SysRoleResService;
import com.creidtsys.utils.JsonMessage;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
/**
 * 
* @ClassName: SysRoleResController
* @Description: TODO 权限角色资源controller
* @author liuyj
* @date 2017年8月26日 上午10:54:04
*
 */
@Controller
@RequestMapping("sysRoleRes")
public class SysRoleResController { 
	@Autowired
	private SysRoleResService  sysRoleResService ;
	private static ObjectMapper mapper = new ObjectMapper() ;

	/**
	 * 
	* @Title: resRoleTree 
	* @Description: TODO 获取角色权限树
	* @param roleId
	* @return    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/resRoleTree",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage resRoleTree(String roleId){
		List<SysRoleRes> list = sysRoleResService.resRoleTree(roleId);
		return new JsonMessage().success(list);
	}
	/**
	 * 
	* @Title: savrRela 
	* @Description: TODO 修改角色资源关系
	* @param data
	* @return
	* @throws JsonParseException
	* @throws JsonMappingException
	* @throws IOException    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/savrRela",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage savrRela(String data) throws JsonParseException, JsonMappingException, IOException{
	    Map<String,String> map= mapper.readValue(data, new TypeReference<Map<String,String>>() { });  
	    sysRoleResService.saveRela(map);
		return new JsonMessage().success();
	}
	
}
