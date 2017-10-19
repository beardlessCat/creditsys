package com.creidtsys.apps.courseManage.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.creidtsys.apps.courseManage.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController {
	@Resource
	private TestService testService ;
	@RequestMapping("/testMysql")
	public void testMysql(){
		testService.testMysql(); 
	}
}
