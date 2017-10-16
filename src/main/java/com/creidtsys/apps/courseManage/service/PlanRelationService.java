package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.PlanRelation;


@Service
public class PlanRelationService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<PlanRelation> getTreeGrid(String otherId) {
		// TODO Auto-generated method stub
		List<PlanRelation> list = sessionFactory.openSession().selectList("cn.sys.courseManage.entity.PlanRelationMapper.selectList", otherId);
		return list;
	}

	public void add(PlanRelation planRelation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.courseManage.entity.PlanRelationMapper.add",planRelation);
	}

	public Boolean checkExists(PlanRelation planRelation) {
		boolean b = false ;
		// TODO Auto-generated method stub
		List<PlanRelation> p = sessionFactory.openSession().selectList("cn.sys.courseManage.entity.PlanRelationMapper.checkExists",planRelation);
		if(p.size()>0){
			b=true;
		}
		return b;
	}

	public void deleteType(String prId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.courseManage.entity.PlanRelationMapper.delete",prId);
	}

	public void edit(PlanRelation planRelation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.courseManage.entity.PlanRelationMapper.edit",planRelation);
	}

	public List<PlanRelation> getAllDirect(String majorId) {
		// TODO Auto-generated method stub
		List<PlanRelation> list =sessionFactory.openSession().selectList("cn.sys.courseManage.entity.PlanRelationMapper.getAllDirect",majorId);
		return list;
	}

	public List<PlanRelation> getAllCourse(PlanRelation planRelation) {
		// TODO Auto-generated method stub
		 List<PlanRelation> list = sessionFactory.openSession().selectList("cn.sys.courseManage.entity.PlanRelationMapper.getAllCourse",planRelation);
		return list;
	}

	public List<PlanRelation> oneData(String majorId) {
		// TODO Auto-generated method stub
		List<PlanRelation> l = sessionFactory.openSession().selectList("cn.sys.courseManage.entity.PlanRelationMapper.oneData",majorId);
 		return l;
	}

	public List<PlanRelation> check(String majorId) {
		// TODO Auto-generated method stub
		List<PlanRelation> l=sessionFactory.openSession().selectList("cn.sys.courseManage.entity.PlanRelationMapper.check",majorId);
		return l;
	}

	public void addCourse(PlanRelation planRelation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.courseManage.entity.PlanRelationMapper.addCourse",planRelation);
	}
}
