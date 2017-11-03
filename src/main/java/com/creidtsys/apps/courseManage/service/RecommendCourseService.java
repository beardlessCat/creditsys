package com.creidtsys.apps.courseManage.service;

import java.util.List;
import java.util.Map;
import java.util.Queue;

import com.creidtsys.apps.courseManage.entity.HTMLInfo;
import com.creidtsys.apps.manage.entity.Relation;

public interface RecommendCourseService {

	List<Map<String, String>> getCourseGra(Relation relation);
	//递归查询所有课程的依赖课程
	public List<String> getList(List<String> list,Queue<String> queue) ;
	//拼成数据格式
	public List<Map<String,String>> initData(List<String> list)  ;
	//获得全部需要课程
	public List<String> getAllNeedCourse(Relation relation) ;
	
	public List<Map<String,String>> getTreeDate(List<String> list ,String positionName) ;
	//初始化根据学习进度查询的树
	List<Map<String, String>> getChoosedList(String userId, String relationId);
	
	HTMLInfo getRecInfo(String userId, String relationId);
}