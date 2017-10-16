package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.TestTreeGrid;

@Service
public class TestTreeGridService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<TestTreeGrid> selectList() {
		// TODO Auto-generated method stub
		return sessionFactory.openSession().selectList("cn.sys.manage.entity.TestTreeGrid.selectList");
	}

}
