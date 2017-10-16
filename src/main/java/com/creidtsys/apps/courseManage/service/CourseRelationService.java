package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.CourseRelation;

@Service
public class CourseRelationService {
	@Autowired
	private SqlSessionFactory sessionFactory ;
	public void addRela(CourseRelation courseRelation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.CourseRelationMapper.addRela",courseRelation) ;
	}
	public void deleteByOtherId(String otherId){
		sessionFactory.openSession().delete("cn.sys.manage.entity.CourseRelationMapper.deleteByOtherId", otherId);
	}
	public List<CourseRelation> getTreeGrid(String otherId) {
		// TODO Auto-generated method stub
		List<CourseRelation> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.CourseRelationMapper.getTreeGrid",otherId);
		return list;
	}
	public void deleteCourseRe(String srId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.CourseRelationMapper.del", srId);
	}
	public List<CourseRelation> getCourse(String otherId) {
		// TODO Auto-generated method stub
		List<CourseRelation> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.CourseRelationMapper.getCourse",otherId) ;
		return list;
	}
	public List<CourseRelation> getBySrPid(String srPid) {
		// TODO Auto-generated method stub
		List<CourseRelation> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.CourseRelationMapper.getCourse.getBySrPid",srPid);
		return list;
	}
	public List<CourseRelation>  findByOtherId(String otherId) {
		// TODO Auto-generated method stub
		List<CourseRelation> list =sessionFactory.openSession().selectList("cn.sys.manage.entity.CourseRelationMapper.findByOtherId",otherId);
		return list;
	}
	public void editByOtherId(CourseRelation courseRelation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.CourseRelationMapper.editByOtherId",courseRelation);
	}

	
}
