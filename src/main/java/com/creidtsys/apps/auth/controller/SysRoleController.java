package com.creidtsys.apps.auth.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.auth.entity.SysRole;
import com.creidtsys.apps.auth.service.SysRoleService;
import com.creidtsys.apps.auth.service.SysUserService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.TreeModel;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
/**
 * 
* @ClassName: SysRoleController
* @Description: TODO 权限角controller层
* @author liuyj
* @date 2017年8月26日 上午10:35:26
*
 */
@Controller
@RequestMapping("/sysRole")
public class SysRoleController {
	@Autowired
	private SysRoleService sysRoleService ;
	@Autowired
	private SysUserService sysUserService ;
	private static ObjectMapper mapper = new ObjectMapper() ;
	private final String LIST = "page/auth/role/list"; 
	private final String TOADD = "page/auth/role/newRole" ;
	private final String TOEDIT ="page/auth/role/editRole" ;
	private final String TOAUTH ="page/auth/role/allotResToRole" ;
	public static final String ROOT = "0";  

	/**
	 * 
	* @Title: list 
	* @Description: TODO 跳转到角色主界面 
	* @return    
	* @return String    返回类型
	 */
	@RequiresPermissions(value={"role:serch","user:create"}, logical= Logical.AND)
	@RequestMapping("/list")
	public String list(){
		return LIST ;
	}
	@RequestMapping("/toAuth")
	public String toAuth(){
		return TOAUTH ;
	}
	/**
	 * 
	* @Title: toAdd 
	* @Description: TODO 跳转到添加界面
	* @return    
	* @return String    返回类型
	 */
	@RequestMapping("/toAdd")
	public String toAdd(){
		return TOADD ;
	}
	/**
	 * 
	* @Title: TOEDIT 
	* @Description: TODO 跳转到编辑界面 
	* @return    
	* @return String    返回类型
	 */
	
	@RequestMapping("/toEdit")
	public String TOEDIT(){
		return TOEDIT ;
	}
	@RequestMapping(value="/allRole" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  Map<String, Object>  allRole (String data) throws JsonParseException, JsonMappingException, IOException{
		
		SysRole sysRole= mapper.readValue(data, new TypeReference<SysRole>() { });  
		int page = Integer.parseInt(sysRole.getPageNumber()) ;  
		int rows =Integer.parseInt(sysRole.getPageSize()) ;   
		String roleParentId = sysRole.getRoleParentId() ;
		Map<String, Object> map = new HashMap<String, Object>();  
		List<SysRole> listAll = sysRoleService.getAllRole(roleParentId) ;  
		map.put("total", listAll.size());//total键 存放总记录数，必须的    
		PageHelper.startPage(page,rows);  
		List<SysRole> listPage = sysRoleService.getAllRole(roleParentId) ;  
		map.put("rows", listPage);//rows键 存放每页记录 list             
        return  map ;
	}
	/**
	 * 
	* @Title: initRoleTree 
	* @Description: TODO 初始化角色树
	* @return    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/initRoleTree",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public List<TreeModel> initRoleTree(){
		
		 // 默认从根节点开始  
        String id = ROOT;  
        TreeModel tm = sysRoleService.selectTree(id);  
        return tm.getChildren();  
	}
	/**
	 * 
	* @Title: delDept 
	* @Description: TODO 删除角色信息 
	* @param ids
	* @return    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/delRoles" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage delDept(String ids){
		sysRoleService.delRoles(ids) ;
		return new JsonMessage().success() ;
	}
	/**
	 * 
	* @Title: addRole 
	* @Description: TODO 添加角色信息
	* @param data  角色信息json串
	* @return
	* @throws JsonParseException
	* @throws JsonMappingException
	* @throws IOException    
	* @return JsonMessage    返回类型
	 */
	
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addRole(String data) throws JsonParseException, JsonMappingException, IOException{
		SysRole sysRole = mapper.readValue(data, new TypeReference<SysRole>() { });
		sysRole.setRoleId(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
		sysRoleService.saveRole(sysRole);
		return new JsonMessage().success();
	}
	/**
	 * 
	* @Title: edit 
	* @Description: TODO 修改角色信息
	* @param data
	* @return
	* @throws JsonParseException
	* @throws JsonMappingException
	* @throws IOException    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/edit" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage edit(String data) throws JsonParseException, JsonMappingException, IOException{
		SysRole sysRole = mapper.readValue(data, new TypeReference<SysRole>() { });
		sysRoleService.updateRole(sysRole) ;
		return new JsonMessage().success() ;
	}
	/**
	 * 
	* @Title: getById 
	* @Description: TODO 查询角色树
	* @param roleId
	* @return
	* @throws JsonParseException
	* @throws JsonMappingException
	* @throws IOException    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/getById" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage getById(String roleId) throws JsonParseException, JsonMappingException, IOException{
		SysRole sysRole = sysRoleService.getById(roleId) ;
		return new JsonMessage().success(sysRole) ;
	}
}
