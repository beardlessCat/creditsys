package com.creidtsys.apps.manage.service;

import java.util.List;

import com.creidtsys.apps.manage.entity.Relation;

public interface RelationService {


	public List<Relation> getTreeGrid()  ;

	public void add(Relation relation)  ;

	public void del(String relationId)  ;
	public Relation getById(String relationId) ;

	public void edit(Relation relation)  ;

	public List<Relation> getTreeList(String companyId);

	public List<Relation> getAllPoint(String relationId);

	public Relation getPosition(String relationId)  ;
	public List<Relation> getTree()  ;
}
