package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.CultivateScheme;


@Service
public class CultivateSchemeService {
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	public List<CultivateScheme> selectAll(String majorId) {
		// TODO Auto-generated method stub
		List<CultivateScheme> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.CultivateSchemeMapper.selectAll",majorId);
		return list ;
	}

	public void deleteCultivate(String cultivateId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.CultivateSchemeMapper.deleteCultivate",cultivateId) ;
 	}

	public void addCultivate(CultivateScheme cultivateScheme) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.CultivateSchemeMapper.addCultivate", cultivateScheme) ;
	}

	public void editCultivate(CultivateScheme cultivateScheme) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.CultivateSchemeMapper.editCultivate", cultivateScheme);
	}

	public CultivateScheme getById(String cultivateId) {
		// TODO Auto-generated method stub
		CultivateScheme cultivateScheme =sessionFactory.openSession().selectOne("cn.sys.manage.entity.CultivateSchemeMapper.getById",cultivateId);
		return cultivateScheme;
	}
	
	public CultivateScheme getByMajorId(String majorId)
	{
		CultivateScheme cultivateScheme = sessionFactory.openSession().selectOne("cn.sys.manage.entity.CultivateSchemeMapper.getByMajorId", majorId);
		return cultivateScheme;	
	}
}
