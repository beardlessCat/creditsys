package com.creidtsys.apps.auth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.creidtsys.security.realm.ShiroDbRealm;
/**
 * 
* @ClassName: PageContoller
* @Description: TODO 页面跳转controller
* @author liuyj
* @date 2017年9月25日 下午1:51:29
*
 */
@Controller
@RequestMapping("/page")
public class PageContoller {  
	private final String NOPERS = "page/error/noperms" ;
	private static Logger logger = LoggerFactory.getLogger(ShiroDbRealm.class);
	@RequestMapping("/wsyyt")
	public String toWsyyt(){
		return "/wsyyt/index" ;
	}
	/**
	 * 初始登陆界面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView tologin(HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.debug("来自IP[" + request.getRemoteHost() + "]的访问");
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("login");
		return modelView;
	}
	/**
	 * 
	* @Title: toIndex 
	* @Description: TODO 跳转到网上营业厅主页
	* @return    
	* @return String    返回类型
	 */
	@RequestMapping("/index")
	public ModelAndView toIndex() {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("redirect:index");
		return modelView;
	}

	//退出系统
	@RequestMapping(value = "/exitUser")
	@ResponseBody
	public ModelAndView logout() {
		ModelAndView modelView = new ModelAndView();
		Subject currentUser = SecurityUtils.getSubject();
		String result = "logout";
		currentUser.logout();
		modelView.setViewName("redirect:login");
		return modelView;
	}
	/*
	 * json格式
		{
		    result:"success",
		    news:["8月20号唱响东方活动","《舞林大会》投票活动截止日期","关于用电积分礼品兑换公告","关于彩虹营业厅调整域名地址的重"]
		}
	*/
	/**
	 * 
	* @Title: initNotice 
	* @Description: TODO  初始化公告 
	* @return    
	* @return JSONObject    返回类型
	 */
	@RequestMapping(value="initNotice",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody  
	public Map<String,Object> initNotice(){                 //是否使用jsonObject没有影响
        Map<String, Object> map = new HashMap<String, Object>();  
        List<String> list = new ArrayList<String>() ;
        list.add("8月20号唱响东方活动");
        list.add("《舞林大会》投票活动截止日期");
        list.add("关于用电积分礼品兑换公告");
        list.add("关于彩虹营业厅调整域名地址的重");
        map.put("result", "success") ;
        map.put("news", list) ;
        return map ;
	}
	/**
	 * 
	* @Title: noPers 
	* @Description: TODO  无权限跳转界面 
	* @return    
	* @return String    返回类型
	 */
	@RequestMapping("/noPers")
	public String noPers(){
		return NOPERS ;
	}
}
	
//生活中可能会出现这样那样的意外
//只要你们携手共同面对
//最终只会让你们爱的更深
/*   
  
 	 try{	
		 living();
	 }catch(Exception e){
		 faceTogether();
	 }finally{
		 you.love++;
	 }   
	 	    --by l&&x
	 	    --Oct.10.2017 


*/                     
