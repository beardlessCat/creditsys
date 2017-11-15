package com.creidtsys.apps.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.PaperRelationDao;
import com.creidtsys.apps.manage.entity.PaperRelation;
import com.creidtsys.apps.manage.service.PaperRelationService;
@Service("paperRelationService")
public class PaperRelationServiceImpl implements PaperRelationService{
	@Resource
	private PaperRelationDao paperRelationDao ;
	@Override
	public List<PaperRelation> getTreeGrid(String otherId) {
		//获得prid
		PaperRelation paperRelation = paperRelationDao.getByOtherId(otherId) ;
		// TODO Auto-generated method stub
		//根据prid查询其所有子节点
		return paperRelationDao.getChild(paperRelation.getPrId()) ;
	}

	@Override
	public void addRelation(PaperRelation paperRelation) {
		// TODO Auto-generated method stub
		paperRelationDao.addRelation(paperRelation) ;
	}

	@Override
	public void deletePosition(String prId) {
		// TODO Auto-generated method stub
		paperRelationDao.deletePosition(prId) ;
	}

	@Override
	public PaperRelation getRealtionById(String prId) {
		// TODO Auto-generated method stub
		return paperRelationDao.getRealtionById(prId);
	}

	@Override
	public void editRelation(PaperRelation paperRelation) {
		// TODO Auto-generated method stub
		paperRelationDao.editRelation(paperRelation) ;
	}

	@Override
	public void deleteByOtherId(String otherId) {
		// TODO Auto-generated method stub
		paperRelationDao.deleteByOtherId(otherId) ;
	}

	@Override
	public void eidtByOtherId(PaperRelation paperRelation) {
		// TODO Auto-generated method stub
		paperRelationDao.eidtByOtherId(paperRelation) ;
	}

	
	@Override
	public List<PaperRelation> selectByOtherId(String otherId) {
		// TODO Auto-generated method stub
		return paperRelationDao.selectByOtherId(otherId);
	}

}
