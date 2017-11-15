package com.creidtsys.apps.manage.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.PaperRelation;

public interface PaperRelationService {
	

	public List<PaperRelation> getTreeGrid(String paperName)  ;

	public void addRelation(PaperRelation paperRelation) ;

	public void deletePosition(String prId) ;
	
	public PaperRelation getRealtionById(String prId) ;

	public void editRelation(PaperRelation paperRelation) ;

	public void deleteByOtherId(String otherId) ;

	public void eidtByOtherId(PaperRelation paperRelation)  ;

	public List<PaperRelation> selectByOtherId(String otherId) ;

	public List<PaperRelation> getTitleList(String paperId);

	public List<Map<String,Object>> getBigList(String paperId);

	public List<PaperRelation> getSmallList(String paperId);
	
}
