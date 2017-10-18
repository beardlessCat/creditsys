package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.CourseType;

public interface CourseTypeDao {

	List<CourseType> selectList();

	void addType(CourseType courseType);

	void editType(CourseType courseType);

	void deleteType(String ctypeId);

}
