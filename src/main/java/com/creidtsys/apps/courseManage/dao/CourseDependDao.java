package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.CourseDepend;

public interface CourseDependDao {

	void addCourseDepend(CourseDepend courseDepend);

	void editCourseDepend(CourseDepend courseDepend);

	List<CourseDepend> getBySid(String courseSid);

	void editChecked(String dependId);

	void deleteByCourseSid(String courseId);

	List<CourseDepend> getByPsid(String coursePsid);
	
}
