package com.creidtsys.apps.auth.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;








import org.springframework.web.servlet.ModelAndView;

import com.creidtsys.apps.auth.entity.SysDept;
import com.creidtsys.apps.auth.service.SysDeptService;
import com.creidtsys.utils.JsonMessage;
import com.creidtsys.utils.TreeModel;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
/**
 * 
* @ClassName: SysDeptController
* @Description: TODO 权限组织机构controller层
* @author liuyj
* @date 2017年8月26日 上午10:42:22
*
 */
@Controller
@RequestMapping("/sysDept")
public class SysDeptController {
	@Autowired
	private SysDeptService sysDeptService ;
	private static ObjectMapper mapper = new ObjectMapper() ;
	private final String  LIST = "page/auth/dept/list" ;
	private final String TOADD  = "page/auth/dept/addDept" ;
	private final String TOEDIT = "page/auth/dept/editDept" ;
	public static final String ROOT = "0";  
	

	/**
	 * 
	* @Title: toIndex 
	* @Description: TODO 主界面
	* @param request
	* @param response
	* @param model
	* @return    
	* @return ModelAndView    返回类型
	 */
	@RequestMapping("/index")
	public ModelAndView toIndex(HttpServletRequest request, HttpServletResponse response, Model model) {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("index");
		return modelView;
	}
	/**
	 * 
	* @Title: list 
	* @Description: TODO  跳转到组织机构管理主界面 
	* @return    
	* @return String    返回类型
	 */
	@RequestMapping("/list")
	public String list(){
		return LIST ;
	}
	/**
	 * 
	* @Title: toEdit 
	* @Description: TODO 跳转到编辑界面 
	* @return    
	* @return String    返回类型
	 */
	@RequestMapping("/toEdit")
	public String toEdit(){
		return  TOEDIT;
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
	* @Title: allDept 
	* @Description: TODO  查询全部组织机构
	* @param data
	 * @return 
	* @return
	* @throws JsonParseException
	* @throws JsonMappingException
	* @throws IOException    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/allDept" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  JSONObject  allDept (String data) throws JsonParseException, JsonMappingException, IOException{
		    SysDept sysDept= mapper.readValue(data, new TypeReference<SysDept>() { });  
	        int page = Integer.parseInt(sysDept.getPageNumber()) ;  
	        int rows =Integer.parseInt(sysDept.getPageSize()) ;   
	        String deptParentId = sysDept.getDeptParentId() ;
	        Map<String, Object> map = new HashMap<String, Object>();  
	        List<SysDept> listAll = sysDeptService.getAllDept(deptParentId) ;  
	        map.put("total", listAll.size());//total键 存放总记录数，必须的    
	        PageHelper.startPage(page,rows);  
	        List<SysDept> listPage = sysDeptService.getAllDept(deptParentId) ;  
	        map.put("rows", listPage);//rows键 存放每页记录 list             
	       return  JSONObject.fromObject(map) ;
	}
	/**
	 * 
	* @Title: getTree 
	* @Description: TODO 初始化组织机构树 
	* @return    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/initDeptTree",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public List<TreeModel> getTree(){
		
		 // 默认从根节点开始  
        String id = ROOT;  
        TreeModel tm = sysDeptService.selectTree(id);  
        return tm.getChildren();  
	}
	/**
	 * 
	* @Title: addDept 
	* @Description: TODO 添加组织机构 
	* @param data 前台传来的参数
	* @return
	* @throws JsonParseException
	* @throws JsonMappingException
	* @throws IOException    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addDept(String data) throws JsonParseException, JsonMappingException, IOException{
		SysDept sysDept = mapper.readValue(data, new TypeReference<SysDept>() { });
		sysDept.setDeptId(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
		sysDeptService.saveDept(sysDept);
		return new JsonMessage().success();
	}
	/**
	 * 
	* @Title: delDept 
	* @Description: TODO 删除组织机构 
	* @param ids   主键用逗号拼接成的字符串
	* @return    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/delDept" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage delDept(String ids){
		sysDeptService.delDept(ids) ;
		return new JsonMessage().success() ;
	}
	/**
	 * 
	* @Title: edit 
	* @Description: TODO 修改部门信息
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
		SysDept sysDept = mapper.readValue(data, new TypeReference<SysDept>() { });
		sysDeptService.updateDept(sysDept) ;
		return new JsonMessage().success() ;
	}
	
	@RequestMapping(value="/getById" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage getById(String deptId) throws JsonParseException, JsonMappingException, IOException{
		
		SysDept sysdept = sysDeptService.getById(deptId) ;
		return new JsonMessage().success(sysdept) ;
	}
}
