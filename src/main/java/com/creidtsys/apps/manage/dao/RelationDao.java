package com.creidtsys.apps.manage.dao;

import java.util.List;

import com.creidtsys.apps.manage.entity.Relation;

public interface RelationDao {

	List<Relation> selectList();

	void add(Relation relation);

	void deleteRelation(String relationId);

	Relation getById(String relationId);

	void edit(Relation relation);

	List<Relation> getTreeList(String companyId);

	List<Relation> getAllPoint(String relationId);

	Relation getPosition(String relationId);

	List<Relation> getTree();

}
