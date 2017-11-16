package com.creidtsys.apps.manage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.PaperRelationDao;
import com.creidtsys.apps.manage.entity.Paper;
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
		paperRelationDao.delRelation(prId); ;
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

	//需要修改成mysql版本
	@Override
	public List<PaperRelation> selectByOtherId(String otherId) {
		// TODO Auto-generated method stub
		//先通过otherid得到prId的集合
		PaperRelation p =  paperRelationDao.getByOtherId(otherId) ;
		//循环prid的集合，获得所需relationRelation的集合
		List<PaperRelation> list = paperRelationDao.getChild(p.getPrId()) ;
		return list;
	}

	@Override
	public List<PaperRelation> getTitleList(String paperId) {
		// TODO Auto-generated method stub
		PaperRelation paperRelation = paperRelationDao.getByOtherId(paperId) ;
		// TODO Auto-generated method stub
		//根据prid查询其所有子节点
		return paperRelationDao.getTitleList(paperRelation.getPrId()) ;
	}

	@Override
	public List<Map<String,Object>> getBigList(String paperId) {
		// TODO Auto-generated method stub
		PaperRelation paperRelation = paperRelationDao.getByOtherId(paperId) ;
		List<PaperRelation> list=paperRelationDao.getBigList(paperRelation.getPrId()) ;
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>() ;
		for(PaperRelation relation:list){
			List<PaperRelation> childList=paperRelationDao.getBigList(relation.getPrId()) ;
			Map<String,Object> idMap = new HashMap<String, Object>() ;
			idMap.put("parent", relation) ;
			idMap.put("child", childList) ;
			listMap.add(idMap) ;
		}
		//根据prid查询其所有子节点
		return listMap ;
	}

	@Override
	public List<PaperRelation> getSmallList(String paperId) {
		// TODO Auto-generated method stub
		PaperRelation paperRelation = paperRelationDao.getByOtherId(paperId) ;
		// TODO Auto-generated method stub
		//根据prid查询其所有子节点
		return paperRelationDao.getSmallList(paperRelation.getPrId()) ;
	}

}
