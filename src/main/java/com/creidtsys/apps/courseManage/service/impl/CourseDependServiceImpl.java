package com.creidtsys.apps.courseManage.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.CourseDependDao;
import com.creidtsys.apps.courseManage.entity.CourseDepend;
import com.creidtsys.apps.courseManage.service.CourseDependService;
@Service("courseDependService")
public class CourseDependServiceImpl implements CourseDependService{
	private CourseDependDao  courseDependDao ;
	@Override
	public void add(CourseDepend courseDepend) {
		// TODO Auto-generated method stub
		courseDependDao.addCourseDepend(courseDepend) ;
	}

	@Override
	public void edit(CourseDepend courseDepend) {
		// TODO Auto-generated method stub
		courseDependDao.editCourseDepend(courseDepend) ;
	}

	@Override
	public List<CourseDepend> getBySid(String courseSid) {
		// TODO Auto-generated method stub
		return courseDependDao.getBySid(courseSid);
	}

	@Override
	public void editChecked(String dependId) {
		// TODO Auto-generated method stub
		courseDependDao.editChecked(dependId) ;
	}

	@Override
	public void deleteByCourseSid(String courseId) {
		// TODO Auto-generated method stub
		courseDependDao.deleteByCourseSid(courseId) ;
	}

	@Override
	public List<CourseDepend> getByPsid(String coursePsid) {
		// TODO Auto-generated method stub
		return courseDependDao.getByPsid(coursePsid);
	}

}
