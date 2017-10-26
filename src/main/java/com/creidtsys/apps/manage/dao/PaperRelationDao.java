package com.creidtsys.apps.manage.dao;

import java.util.List;

import com.creidtsys.apps.manage.entity.PaperRelation;

public interface PaperRelationDao {

	List<PaperRelation> selectList(String paperName);

	void eidtByOtherId(PaperRelation paperRelation);

	List<PaperRelation> selectByOtherId(String otherId);

	void deleteByOtherId(String otherId);

	void editRelation(PaperRelation paperRelation);

	void deletePosition(String prId);

	void addRelation(PaperRelation paperRelation);

	PaperRelation getRealtionById(String prId);

	List<PaperRelation> getChild(String prId);

	PaperRelation getByOtherId(String otherId);

}
