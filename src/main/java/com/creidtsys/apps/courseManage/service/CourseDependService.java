package com.creidtsys.apps.courseManage.service;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.CourseDepend;


public interface CourseDependService {

	public void add(CourseDepend courseDepend) ; 

	public void edit(CourseDepend courseDepend) ; 

	public List<CourseDepend> getBySid(String courseSid) ; 

	public void editChecked(String dependId) ;

	public void deleteByCourseSid(String courseId) ;

	public List<CourseDepend> getByPsid(String coursePsid) ;
}
