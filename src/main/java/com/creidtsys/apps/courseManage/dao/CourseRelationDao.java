package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.CourseRelation;

public interface CourseRelationDao {

	public void addRela(CourseRelation courseRelation) ;

	public void del(String otherId) ;
		
	public List<CourseRelation> getTreeGrid(String otherId) ;

	public void deleteCourseRe(String srId) ;

	public List<CourseRelation> getCourse(String otherId) ;

	public List<CourseRelation> getBySrPid(String srPid) ;
	
	public List<CourseRelation> findByOtherId(String otherId) ;

	public void editByOtherId(CourseRelation courseRelation) ;

	public List<CourseRelation> getCourseIdBySrid(String srId);
}
