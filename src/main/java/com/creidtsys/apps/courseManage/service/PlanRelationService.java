package com.creidtsys.apps.courseManage.service;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.PlanRelation;


public interface PlanRelationService {

	public List<PlanRelation> getTreeGrid(String otherId) ;

	public void add(PlanRelation planRelation) ;

	public Boolean checkExists(PlanRelation planRelation) ;

	public void deleteType(String prId)  ;

	public void edit(PlanRelation planRelation)  ;

	public List<PlanRelation> getAllDirect(String majorId) ;

	public List<PlanRelation> getAllCourse(PlanRelation planRelation) ;

	public List<PlanRelation> oneData(String majorId)  ;

	public List<PlanRelation> check(String majorId) ;

	public void addCourse(PlanRelation planRelation) ;
}
