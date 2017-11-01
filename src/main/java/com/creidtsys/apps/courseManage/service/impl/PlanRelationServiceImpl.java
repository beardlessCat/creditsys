package com.creidtsys.apps.courseManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.PlanRelationDao;
import com.creidtsys.apps.courseManage.entity.PlanRelation;
import com.creidtsys.apps.courseManage.service.PlanRelationService;
@Service("/planRelationService")
public class PlanRelationServiceImpl implements PlanRelationService {
	@Autowired
	private PlanRelationDao relationDao ;
	@Override
	public List<PlanRelation> getTreeGrid(String otherId) {
		// TODO Auto-generated method stub
		return relationDao.selectList(otherId);
	}

	@Override
	public void add(PlanRelation planRelation) {
		// TODO Auto-generated method stub
		relationDao.add(planRelation) ;
	}

	@Override
	public Boolean checkExists(PlanRelation planRelation) {
		// TODO Auto-generated method stub
		boolean b = false ;
		List<PlanRelation> p = relationDao.checkExist(planRelation);
		if(p.size()>0){
			b=true;
		}
		return b;
	}

	@Override
	public void deleteType(String prId) {
		// TODO Auto-generated method stub
		relationDao.delete(prId) ;
	}

	@Override
	public void edit(PlanRelation planRelation) {
		// TODO Auto-generated method stub
		relationDao.edit(planRelation) ;
	}

	@Override
	public List<PlanRelation> getAllDirect(String majorId) {
		// TODO Auto-generated method stub
		return relationDao.getAllDirect(majorId);
	}

	@Override
	public List<PlanRelation> getAllCourse(PlanRelation planRelation) {
		// TODO Auto-generated method stub
		return relationDao.getAllCourse(planRelation);
	}

	@Override
	public List<PlanRelation> oneData(String majorId) {
		// TODO Auto-generated method stub
		return relationDao.oneData(majorId);
	}

	@Override
	public List<PlanRelation> check(String majorId) {
		// TODO Auto-generated method stub
		return relationDao.check(majorId);
	}

	@Override
	public void addCourse(PlanRelation planRelation) {
		// TODO Auto-generated method stub
		relationDao.addCourse(planRelation) ;
		}

}
