package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.Node;

@Service
public class TestService {
	@Autowired
	private SqlSessionFactory sessionFactory ;
	public void testMysql() {
		// TODO Auto-generated method stub
		List<Node>list = sessionFactory.openSession().selectList("testMysql",7) ;
		System.out.println(list.size());
	}
}
