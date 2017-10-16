package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.CourseDepend;

@Service
public class CourseDependService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public void add(CourseDepend courseDepend) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.CourseDependMapper.addCourseDepend",courseDepend) ;
	}

	public void edit(CourseDepend courseDepend) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.CourseDependMapper.editCourseDepend", courseDepend);
	}

	public List<CourseDepend> getBySid(String courseSid) {
		// TODO Auto-generated method stub
		List<CourseDepend> list =sessionFactory.openSession().selectList("cn.sys.manage.entity.CourseDependMapper.getBySid",courseSid);
		return list;
	}

	public void editChecked(String dependId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.CourseDependMapper.editChecked", dependId) ;
	}

	public void deleteByCourseSid(String courseId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.CourseDependMapper.deleteByCourseSid", courseId);
	}

	public List<CourseDepend> getByPsid(String coursePsid) {
		// TODO Auto-generated method stub
		List<CourseDepend> list =sessionFactory.openSession().selectList("cn.sys.manage.entity.CourseDependMapper.getByPsid",coursePsid) ;
		return list;
	}
}
