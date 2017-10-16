package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.PaperDetial;

@Service
public class PaperDetialService {
	@Autowired
	private SqlSessionFactory sessionFactory ;
	public List<PaperDetial> findAll() {
		// TODO Auto-generated method stub
		List<PaperDetial> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.PaperDetialMapper.selectList");
		return list;
	}
	public void deleteDetial(String detialId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.PaperDetialMapper.deleteDetial", detialId);
	}
	public void add(PaperDetial paperDetial) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.PaperDetialMapper.addDetial", paperDetial);
	}
	public void editCompany(PaperDetial paperDetial) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.PaperDetialMapper.editDetial",paperDetial);
	}
}
