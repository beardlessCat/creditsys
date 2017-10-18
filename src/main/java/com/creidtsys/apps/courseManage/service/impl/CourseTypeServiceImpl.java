package com.creidtsys.apps.courseManage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.CourseTypeDao;
import com.creidtsys.apps.courseManage.entity.CourseType;
import com.creidtsys.apps.courseManage.service.CourseTypeService;
@Service("courseTypeService")
public class CourseTypeServiceImpl implements CourseTypeService {
	@Resource
	private CourseTypeDao typeDao ;

	@Override
	public List<CourseType> selectAll() {
		// TODO Auto-generated method stub
		return typeDao.selectList();
	}

	@Override
	public void add(CourseType courseType) {
		// TODO Auto-generated method stub
		typeDao.addType(courseType) ;
	}

	@Override
	public void editType(CourseType courseType) {
		// TODO Auto-generated method stub
		typeDao.editType(courseType) ;
	}

	@Override
	public void deleteType(String ctypeId) {
		// TODO Auto-generated method stub
		typeDao.deleteType(ctypeId) ;
	}


}
