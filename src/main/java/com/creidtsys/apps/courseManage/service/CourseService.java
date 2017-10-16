package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.Course;


@Service
public class CourseService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<Course> selectAll(String majorId) {
		// TODO Auto-generated method stub
		List<Course> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.CourseMapper.selectList",majorId);
		return list ;
	}

	public void deleteCourse(String courseId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.CourseMapper.delete",courseId) ;
 	}

	public void addCourse(Course course) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.CourseMapper.addCourse", course) ;
	}

	public void editCourse(Course course) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.CourseMapper.editCourse", course);
	}

	public Course getById(String courseId) {
		// TODO Auto-generated method stub
		Course course =sessionFactory.openSession().selectOne("cn.sys.manage.entity.CourseMapper.getById",courseId);
		return course;
	}
}
