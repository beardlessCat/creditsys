package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.Technology;

@Service
public class TechnologyService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<Technology> selectAll(String technologyName) {
		// TODO Auto-generated method stub
		List<Technology> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.TechnologyMapper.selectList",technologyName);
		return list;
	}

	public void add(Technology technology) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.TechnologyMapper.addtechnology",technology);
	}

	public void edit(Technology technology) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.TechnologyMapper.edittechnology",technology);
	}

	public void deleteTechnology(String technologyId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.TechnologyMapper.delete",technologyId ) ;
	}
	
}
