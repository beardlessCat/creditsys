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

import com.creidtsys.apps.auth.entity.Role;
import com.creidtsys.apps.auth.entity.UserRole;
import com.creidtsys.apps.auth.service.RoleService;

@Controller
@RequestMapping("/ownInfo")
public class OwnInfoController {
	@Resource
	private RoleService roleService ;
	@Resource
	private UserRoleService userRoleService ;
	@RequestMapping(value="/allUser",method = RequestMethod.POST,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JSONArray allUser(){
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		List<Role> list = roleService.findAll();
		List<String> listName = new ArrayList<String>();
		for(Role r : list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id",r.getId());
			map.put("name", r.getRoleName());
			listName.add(r.getRoleName());
			listMap.add(map);
		}
		List<Map<String,Object>> arrMap = new ArrayList<Map<String,Object>>();
		
		for(Map<String,Object> m :listMap){
			Map<String, Object> countMap = new HashMap<String, Object>();
			List<UserRole> ueList = userRoleService.getByRoleId(m.get("id").toString());
			countMap.put("name",m.get("name"));
			countMap.put("value", ueList.size());
			arrMap.add(countMap);
		}
		//arrm.put("nameArr", listName);
		//arrMap.add(arrm);
		return JSONArray.fromObject(arrMap) ;
	}
}
