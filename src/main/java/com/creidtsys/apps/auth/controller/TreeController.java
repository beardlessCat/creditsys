package com.creidtsys.apps.auth.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creidtsys.apps.auth.service.TreeService;
import com.creidtsys.utils.TreeModel;

@Controller
@RequestMapping("/tree")
public class TreeController {
	private final String  TOTREE = "page/auth/tree/tree" ;
	@Autowired
	private TreeService treeService ;
    // 表示根目录的pid  
    public static final String ROOT = "00000000000000000000000000000000";  
    @RequestMapping("/toTree")
    public String toTree(){
    	return TOTREE ;
    }
    /** 
     * 单位部门树(含部门)json 
     */  
    @RequestMapping("/deptTree")  
    @ResponseBody  
    // 返回的是JSON格式  
    public List<TreeModel> deptTree(HttpServletRequest request) {  
        // 默认从根节点开始  
        String id = ROOT;  
        TreeModel tm = treeService.selectTree(id);  
        return tm.getChildren();  
    }  
}
