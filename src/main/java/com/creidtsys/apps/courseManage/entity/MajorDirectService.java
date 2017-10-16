package com.creidtsys.apps.courseManage.entity;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MajorDirectService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<MajorDirect> selectAll(String majorId) {
		// TODO Auto-generated method stub
		List<MajorDirect> list =sessionFactory.openSession().selectList("cn.sys.courseManage.entity.MajorDirectMapper.selectList",majorId);
		return list;
	}

	public void add(MajorDirect majorDirect) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.courseManage.entity.MajorDirectMapper.add",majorDirect);
	}

	public void editType(MajorDirect majorDirect) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.courseManage.entity.MajorDirectMapper.edit",majorDirect);
	}

	public void deleteType(String majorDirectId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.courseManage.entity.MajorDirectMapper.delete",majorDirectId);
	}
}
