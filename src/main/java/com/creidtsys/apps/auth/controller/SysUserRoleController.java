package com.creidtsys.apps.auth.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.auth.entity.SysUserRole;
import com.creidtsys.apps.auth.service.SysUserRoleService;
import com.creidtsys.utils.JsonMessage;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
* @ClassName: SysUserRoleController
* @Description: TODO 用户角色controller
* @author liuyj
* @date 2017年9月4日 下午6:40:17
*
 */
@RequestMapping("/sysUserRole")
@Controller
public class SysUserRoleController {
	private final String ALLOTROLE = "page/auth/user/allotRole" ;
	private static ObjectMapper mapper = new ObjectMapper() ;
	@Autowired
	private SysUserRoleService userRoleService ;
	/**
	 * 
	* @Title: allotRole 
	* @Description: TODO 跳转到分配角色界面
	* @return    
	* @return String    返回类型
	 */
	
	@RequestMapping("/allotUser")
	private String allotRole(){
		return ALLOTROLE ;
	}
	/**
	 * 
	* @Title: getRoleByUser 
	* @Description: TODO 根据用户查询角色
	* @param userId
	* @return
	* @throws JsonParseException
	* @throws JsonMappingException
	* @throws IOException    
	* @return JSONObject    返回类型
	 */
	@RequestMapping(value="/getRoleByUser" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  Map<String,Object>  getRoleByUser (String userId) throws JsonParseException, JsonMappingException, IOException{
	        Map<String, Object> map = new HashMap<String, Object>();  
	        List<SysUserRole> listPage =  userRoleService.getRoleByUser(userId) ;  
	        map.put("rows", listPage);//rows键 存放每页记录 list             
	        return  map ;
	}
	/**
	 * 
	* @Title: saveUserRole 
	* @Description: TODO 为用户赋值角色
	* @param data
	* @return
	* @throws JsonParseException
	* @throws JsonMappingException
	* @throws IOException    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/saveUserRole" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  JsonMessage  saveUserRole (String data) throws JsonParseException, JsonMappingException, IOException{
			SysUserRole sysUserRole = mapper.readValue(data, new TypeReference<SysUserRole>() { });
			userRoleService.saveUserRole(sysUserRole) ;  
			return  new JsonMessage().success() ;
	}
}
