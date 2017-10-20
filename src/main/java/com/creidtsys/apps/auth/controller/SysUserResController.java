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

import com.creidtsys.apps.auth.entity.SysUserRes;
import com.creidtsys.apps.auth.service.SysUserResService;
import com.creidtsys.utils.JsonMessage;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
* @ClassName: SysUserResController
* @Description: TODO 用户资源权限关系controller
* @author liuyj
* @date 2017年8月26日 上午10:58:01
*
 */
@Controller
@RequestMapping("sysUserRes")
public class SysUserResController {
	@Autowired
	private SysUserResService sysUserResService ;
	private static ObjectMapper mapper = new ObjectMapper() ;

	/**
	 * 
	* @Title: getResByUser 
	* @Description: TODO 查询该用户所有权限
	* @param userId
	* @return    
	* @return JSONObject    返回类型
	 */
	@RequestMapping(value="/getResByUser",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public Map<String,Object> getResByUser(String userNo){
		//17.10.20 i改为传递userNo，并返回节点之上的所有节点
	//	List<SysUserRes> list = sysUserResService.getResByUser(userId);
	//	List<SysUserRes> list = sysUserResService.getAllByNo("admin") ;
		List<Map<String, String>> list =sysUserResService.getAuthMenu(userNo) ;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
	/**
	 * 
	* @Title: getUserRes 
	* @Description: TODO 获得用户单独分配的权限
	* @param userId
	* @return    
	* @return JSONObject    返回类型
	 */
	@RequestMapping(value="/getUserRes",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public Map<String,Object> getUserRes(String userId){
		List<SysUserRes> list = sysUserResService.getUserRes(userId);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
	/**
	 * 
	* @Title: getRoleRes 
	* @Description: TODO 获得用户所属全角色的权限
	* @param userId
	* @return    
	* @return JSONObject    返回类型
	 */
	@RequestMapping(value="/getRoleRes",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public Map<String,Object> getRoleRes(String userId){
		List<SysUserRes> list = sysUserResService.getRoleRes(userId);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}
	/**
	 * 
	* @Title: resUserTree 
	* @Description: TODO 获得含有checkbox 的权限树
	* @param userId
	* @return    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/resUserTree",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage resUserTree(String userId){
		List<SysUserRes> list = sysUserResService.resUserTree(userId);
		return new JsonMessage().success(list);
	}
	/**
	 * 
	* @Title: saveUserRes 
	* @Description: TODO 保存用户与权限之间的关系
	* @param userId
	* @return    
	* @return JsonMessage    返回类型
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonParseException 
	 */
	@RequestMapping(value="/saveUserRes",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage saveUserRes(String data) throws JsonParseException, JsonMappingException, IOException{
	    Map<String,String> map= mapper.readValue(data, new TypeReference<Map<String,String>>() { });  
		sysUserResService.saveUserRes(map);
		return new JsonMessage().success();
	}
	/**
	 * 
	* @Title: getAuthMenu 
	* @Description: TODO 获取菜单权限
	* @param userId
	* @return
	* @throws Exception    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/getAuthMenu",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public JsonMessage getAuthMenu(String userNo) throws Exception{
		List<Map<String, String>> list =sysUserResService.getAuthMenu(userNo) ;
		List finalList = sysUserResService.findRoots(list) ;
		return new JsonMessage().success(finalList);
	}
}
