package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.Course;

public interface CourseDao {

	List<Course> selectList(String majorId);

	void delete(String courseId);

	void addCourse(Course course);

	void editCourse(Course course);

	Course getById(String courseId);

}
