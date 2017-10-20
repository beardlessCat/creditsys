package com.creidtsys.apps.courseManage.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.CourseRelationDao;
import com.creidtsys.apps.courseManage.entity.CourseRelation;
import com.creidtsys.apps.courseManage.service.CourseRelationService;
@Service("courseRelationService")
public class CourseRelationServiceImpl implements CourseRelationService{
	@Resource
	private CourseRelationDao courseRelationDao;
	@Override
	public void addRela(CourseRelation courseRelation) {
		// TODO Auto-generated method stub
		courseRelationDao.addRela(courseRelation) ;
	}

	@Override
	public void deleteByOtherId(String otherId) {
		// TODO Auto-generated method stub
		courseRelationDao.del(otherId) ;
	}

	@Override
	public List<CourseRelation> getTreeGrid(String otherId) {
		// TODO Auto-generated method stub
		return courseRelationDao.getTreeGrid(otherId);
	}

	@Override
	public void deleteCourseRe(String srId) {
		// TODO Auto-generated method stub
		courseRelationDao.deleteCourseRe(srId) ;
	}
	
	/**
	 * 根据知识点获取课程信息
	 */
	@Override
	public List<CourseRelation> getCourse(String otherId) {
		// TODO Auto-generated method stub
		//oracle 版本，直接获取	
		//return courseRelationDao.getCourse(otherId);
		/**
		 * mysql 版本
		 * （1）根据pointid 及otherId获得srid
		 * （2）通过srid ，使用mysql函数获得父结果
		 */
		List<CourseRelation> srIdList = courseRelationDao.findByOtherId(otherId) ;
		List<CourseRelation> list = new ArrayList<CourseRelation>() ;
		for(CourseRelation cr : srIdList){
			List<CourseRelation> crlist = courseRelationDao.getCourseIdBySrid(cr.getSrId()) ;
			//list取并集
			crlist.removeAll(list) ;
			list.addAll(crlist) ;
		}
		return list ;
	}

	@Override
	public List<CourseRelation> getBySrPid(String srPid) {
		// TODO Auto-generated method stub
		return courseRelationDao.getBySrPid(srPid);
	}

	@Override
	public List<CourseRelation> findByOtherId(String otherId) {
		// TODO Auto-generated method stub
		return courseRelationDao.findByOtherId(otherId);
	}

	@Override
	public void editByOtherId(CourseRelation courseRelation) {
		// TODO Auto-generated method stub
		courseRelationDao.editByOtherId(courseRelation) ;
	}

}
