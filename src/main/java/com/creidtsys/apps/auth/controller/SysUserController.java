package com.creidtsys.apps.auth.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.creidtsys.apps.auth.entity.SysUser;
import com.creidtsys.apps.auth.service.SysUserService;
import com.creidtsys.security.realm.ShiroDbRealm;
import com.creidtsys.utils.CipherUtil;
import com.creidtsys.utils.JsonMessage;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
/**
 * 
* @ClassName: SysUserController
* @Description: TODO 权限用户Controller层
* @author liuyj
* @date 2017年8月26日 上午10:22:50
*
 */
@Controller
@RequestMapping("/sysUser")
public class SysUserController {
	@Autowired
	private SysUserService userService ;
	private static ObjectMapper mapper = new ObjectMapper() ;
	private final String  LIST = "page/auth/user/list" ;
	private final String TOADD  = "page/auth/user/addUser" ;
	private final String TOEDIT = "page/auth/user/editUser" ;
	private final String TOLISTUSER = "page/auth/user/listUser" ;
	private static Logger logger = LoggerFactory.getLogger(ShiroDbRealm.class);
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
	 * 验证用户名和密码
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, Model model) {
		ModelAndView modelView = new ModelAndView();
		String result = "login";
		// 取得用户名
		String username = request.getParameter("username");
		// 取得 密码，并用MD5加密
		String password = CipherUtil.generatePassword(request.getParameter("password"));
		// String password = request.getParameter("password");
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		Subject currentUser = SecurityUtils.getSubject();
		try {
			currentUser.login(token);// 验证角色和权限
		} catch (AuthenticationException e) {
			e.printStackTrace();
			String msg = "登录密码错误. Password for account " + token.getPrincipal() + " was incorrect.";
			model.addAttribute("message", msg);
			System.out.println(msg);
			modelView.setViewName("login");
		}
		if (currentUser.isAuthenticated()) {// 使用shiro来验证
			token.setRememberMe(true);
			modelView.setViewName("redirect:index");
		} else {
			modelView.setViewName("login");
		}
		return modelView;
	}
	
	/**
	 * 
	* @Title: toListUser 
	* @Description: TODO 跳转到用户权限查及用户授权界面看界面
	* @return    
	* @return String    返回类型
	 */
	@RequestMapping("/toListUser")
	private String toListUser(){
		return TOLISTUSER ;
	}
	
	
	/**
	 * 
	* @Title: list 
	* @Description: TODO 跳转到user主界面 
	* @return    
	* @return String    返回类型
	 */
	@RequestMapping("/list")
	private String list(){
		return LIST ;
	}
	/**
	 * 
	* @Title: toAdd 
	* @Description: TODO 跳转到添加用户界面 
	* @return    
	* @return String    返回类型
	 */
	@RequestMapping("/toAdd")
	private String toAdd(){
		return TOADD ;
	}
	/**
	 * 
	* @Title: toEdit 
	* @Description: TODO 跳转到修改用户界面 
	* @return    
	* @return String    返回类型
	 */
	@RequestMapping("/toEdit") 
	private String toEdit(){
		return TOEDIT ;
	}
	
	@RequestMapping(value="/allUser" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  Map<String,Object>  allUser (String data) throws JsonParseException, JsonMappingException, IOException{
		    SysUser sysUser= mapper.readValue(data, new TypeReference<SysUser>() { });  
	        int page = Integer.parseInt(sysUser.getPageNumber()) ;  
	        int rows =Integer.parseInt(sysUser.getPageSize()) ;   
	        Map<String, Object> map = new HashMap<String, Object>();  
	        List<SysUser> listAll = userService.getAllUser(sysUser) ;  
	        map.put("total", listAll.size());//total键 存放总记录数，必须的    
	        PageHelper.startPage(page,rows);  
	        List<SysUser> listPage = userService.getAllUser(sysUser) ;  
	        map.put("rows", listPage);//rows键 存放每页记录 list             
	       return  map ;
	}
	/**
	 * 
	* @Title: addDept 
	* @Description: TODO 添加用户信息
	* @param data
	* @return
	* @throws JsonParseException
	* @throws JsonMappingException
	* @throws IOException    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/add" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage addDept(String data) throws JsonParseException, JsonMappingException, IOException{
		SysUser sysUser = mapper.readValue(data, new TypeReference<SysUser>() { });
		//md5加密
		String pwd =  CipherUtil.generatePassword(sysUser.getUserPwd());
		sysUser.setUserPwd(pwd);
		sysUser.setUserId(UUID.randomUUID().toString().replaceAll("-", "").toUpperCase());
		userService.saveUser(sysUser);
		return new JsonMessage().success();
	}
	
	/**
	 * 
	* @Title: delUsers 
	* @Description: TODO 批量删除用户 
	* @param ids		 用户标识拼接而成的字符串
	* @return    
	* @return JsonMessage    返回类型
	 */
	@RequestMapping(value="/delUsers" ,method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JsonMessage delUsers(String ids){
		userService.delUsers(ids) ;
		return new JsonMessage().success() ;
	}
	/**
	 * 
	* @Title: edit 
	* @Description: TODO	修改用户信息
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
	    SysUser sysUser= mapper.readValue(data, new TypeReference<SysUser>() { });  
	    //md5加密
  		String pwd =  CipherUtil.generatePassword(sysUser.getUserPwd());
  		sysUser.setUserPwd(pwd);
	    userService.updateDept(sysUser) ;
		return new JsonMessage().success() ;
	}
}