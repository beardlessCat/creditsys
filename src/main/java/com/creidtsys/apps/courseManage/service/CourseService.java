package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.Course;


public interface CourseService {

	public List<Course> selectAll(String majorId) ;

	public void deleteCourse(String courseId)  ;

	public void addCourse(Course course) ;

	public void editCourse(Course course) ;
	public Course getById(String courseId) ;
}
