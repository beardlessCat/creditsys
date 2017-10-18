package com.creidtsys.apps.courseManage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.CourseDao;
import com.creidtsys.apps.courseManage.entity.Course;
import com.creidtsys.apps.courseManage.service.CourseService;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
	@Resource
	private CourseDao courseDao ;

	@Override
	public List<Course> selectAll(String majorId) {
		// TODO Auto-generated method stub
		return courseDao.selectList(majorId);
	}

	@Override
	public void deleteCourse(String courseId) {
		// TODO Auto-generated method stub
		courseDao.delete(courseId) ;
	}

	@Override
	public void addCourse(Course course) {
		// TODO Auto-generated method stub
		courseDao.addCourse(course) ;
	}

	@Override
	public void editCourse(Course course) {
		// TODO Auto-generated method stub
		courseDao.editCourse(course) ;
	}

	@Override
	public Course getById(String courseId) {
		// TODO Auto-generated method stub
		return courseDao.getById(courseId);
	}
}
