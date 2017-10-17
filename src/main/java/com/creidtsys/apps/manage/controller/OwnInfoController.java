/*package com.creidtsys.apps.manage.controller;

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

import com.creidtsys.apps.auth.entity.Role;
import com.creidtsys.apps.auth.entity.SysRole;
import com.creidtsys.apps.auth.entity.UserRole;
import com.creidtsys.apps.auth.service.RoleService;
import com.creidtsys.apps.auth.service.SysRoleService;
import com.creidtsys.apps.auth.service.SysUserRoleService;

@Controller
//@RequestMapping("/ownInfo")
public class OwnInfoController {
	@Resource
	private SysRoleService roleService ;
	@Resource
	private SysUserRoleService userRoleService ;
	@RequestMapping(value="/allUser",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Map<String,Object>>   allUser(){
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		List<SysRole> list = roleService.getAllRole(null) ;
		List<String> listName = new ArrayList<String>();
		for(SysRole r : list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id",r.getRoleId());
			map.put("name", r.getRoleName());
			listName.add(r.getRoleName());
			listMap.add(map);
		}
		List<Map<String,Object>> arrMap = new ArrayList<Map<String,Object>>();
		//----------------------------------------------
		
		for(Map<String,Object> m :listMap){
			Map<String, Object> countMap = new HashMap<String, Object>();
			List<UserRole> ueList =null ;//userRoleService.getRoleByUser("userId");
			countMap.put("name",m.get("name"));
			countMap.put("value", ueList.size());
			arrMap.add(countMap);
		}
		//arrm.put("nameArr", listName);
		//arrMap.add(arrm);
		return arrMap;
	}
}
*/