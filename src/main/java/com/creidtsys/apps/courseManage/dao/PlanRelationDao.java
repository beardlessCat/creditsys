package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.PlanRelation;

public interface PlanRelationDao {

	List<PlanRelation> selectList(String otherId);

	void add(PlanRelation planRelation);

	List<PlanRelation> checkExist(PlanRelation planRelation);

	void delete(String prId);

	void edit(PlanRelation planRelation);

	List<PlanRelation> getAllDirect(String majorId);

	List<PlanRelation> getAllCourse(PlanRelation planRelation);

	List<PlanRelation> oneData(String majorId);

	List<PlanRelation> check(String majorId);

	void addCourse(PlanRelation planRelation);

}
