package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.CourseType;


@Service
public class CourseTypeService {
	@Autowired
	private SqlSessionFactory sessionFactory ;
	public List<CourseType> selectAll() {
		// TODO Auto-generated method stub
		 List<CourseType> list = sessionFactory.openSession().selectList("cn.sys.courseManage.entity.CourseTypeMapper.selectList");
		return list;
	}
	public void add(CourseType courseType) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.courseManage.entity.CourseTypeMapper.addType",courseType);
	}
	public void editType(CourseType courseType) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.courseManage.entity.CourseTypeMapper.editType",courseType);
	}
	public void deleteType(String ctypeId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.courseManage.entity.CourseTypeMapper.deleteType",ctypeId);
	}
}
