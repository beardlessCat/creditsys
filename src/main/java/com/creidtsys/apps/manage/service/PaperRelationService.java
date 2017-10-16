package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.PaperRelation;

@Service
public class PaperRelationService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<PaperRelation> getTreeGrid(String paperName) {
		// TODO Auto-generated method stub
		List<PaperRelation> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.PaperRelationMapper.selectList",paperName);
		return list;
	}

	public void addRelation(PaperRelation paperRelation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.PaperRelationMapper.addRelation",paperRelation);
	}

	public void deletePosition(String prId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.PaperRelationMapper.delRelation",prId);
	}

	public PaperRelation getRealtionById(String prId) {
		// TODO Auto-generated method stub
		PaperRelation paperRelation = sessionFactory.openSession().selectOne("cn.sys.manage.entity.PaperRelationMapper.getRealtionById",prId);
		return paperRelation;
	}

	public void editRelation(PaperRelation paperRelation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.PaperRelationMapper.editRelation",paperRelation);
	}

	public void deleteByOtherId(String otherId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.PaperRelationMapper.deleteByOtherId",otherId);
	}

	public void eidtByOtherId(PaperRelation paperRelation) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.PaperRelationMapper.eidtByOtherId", paperRelation);
	}

	public List<PaperRelation> selectByOtherId(String otherId) {
		// TODO Auto-generated method stub
		List<PaperRelation> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.PaperRelationMapper.selectByOtherId",otherId);
		return list;
	}
}
