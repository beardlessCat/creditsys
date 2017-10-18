package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.CourseType;


public interface CourseTypeService {
	
	public List<CourseType> selectAll();
	public void add(CourseType courseType) ;
	public void editType(CourseType courseType) ;
	public void deleteType(String ctypeId)  ;	
}
