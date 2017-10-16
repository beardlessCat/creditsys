package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.Relation;

@Service
public class RelationService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<Relation> getTreeGrid() {
		// TODO Auto-generated method stub
		List<Relation> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.RelationMapper.selectList");
		return list;
	}

	public void add(Relation relation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.RelationMapper.add",relation) ;
	}

	public void del(String relationId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.RelationMapper.deleteRelation", relationId);
	}

	public Relation getById(String relationId) {
		// TODO Auto-generated method stub
		Relation relation =sessionFactory.openSession().selectOne("cn.sys.manage.entity.RelationMapper.getById", relationId);
		return relation;
	}

	public void edit(Relation relation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.RelationMapper.edit", relation);
	}

	public List<Relation> getTreeList(String companyId) {
		// TODO Auto-generated method stub
		List<Relation> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.RelationMapper.getTreeList",companyId);
		return list;
	}

	public List<Relation> getAllPoint(String relationId) {
		// TODO Auto-generated method stub
		List<Relation> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.RelationMapper.getAllPoint",relationId);
		return list;
	}

	public Relation getPosition(String relationId) {
		// TODO Auto-generated method stub
		Relation re =sessionFactory.openSession().selectOne("cn.sys.manage.entity.RelationMapper.getPosition",relationId);
		return re;
	}

	public List<Relation> getTree() {
		// TODO Auto-generated method stub
		List<Relation> l =sessionFactory.openSession().selectList("cn.sys.manage.entity.RelationMapper.getTree");
		return l;
	}
}
