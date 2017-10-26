package com.creidtsys.apps.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.RelationDao;
import com.creidtsys.apps.manage.entity.Relation;
import com.creidtsys.apps.manage.service.RelationService;
@Service("relationService")
public class RelationServiceImpl implements RelationService{
	@Resource
	private RelationDao relationDao ;
	@Override
	public List<Relation> getTreeGrid() {
		// TODO Auto-generated method stub
		return relationDao.selectList();
	}

	@Override
	public void add(Relation relation) {
		// TODO Auto-generated method stub
		relationDao.add(relation) ;
	}

	@Override
	public void del(String relationId) {
		// TODO Auto-generated method stub
		relationDao.deleteRelation(relationId) ;
	}

	@Override
	public Relation getById(String relationId) {
		// TODO Auto-generated method stub
		return relationDao.getById(relationId);
	}

	@Override
	public void edit(Relation relation) {
		// TODO Auto-generated method stub
		relationDao.edit(relation) ;
	}

	@Override
	public List<Relation> getTreeList(String companyId) {
		// TODO Auto-generated method stub
		return relationDao.getTreeList(companyId);
	}

	@Override
	public List<Relation> getAllPoint(String relationId) {
		// TODO Auto-generated method stub
		return relationDao.getAllPoint(relationId);
	}

	@Override
	public Relation getPosition(String relationId) {
		// TODO Auto-generated method stub
		return relationDao.getPosition(relationId);
	}

	@Override
	public List<Relation> getTree() {
		// TODO Auto-generated method stub
		return relationDao.getTree();
	}

}
