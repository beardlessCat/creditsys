package com.creidtsys.apps.courseManage.service;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.CourseRelation;

public interface CourseRelationService {
	
	public void addRela(CourseRelation courseRelation)  ;
	public void deleteByOtherId(String otherId) ;
	public List<CourseRelation> getTreeGrid(String otherId)  ;
	//根据知识点获取课程
	public void deleteCourseRe(String srId) ;
	public List<CourseRelation> getCourse(String otherId) ;
	public List<CourseRelation> getBySrPid(String srPid) ;
	public List<CourseRelation>  findByOtherId(String otherId) ;
	public void editByOtherId(CourseRelation courseRelation) ;
}
