package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.Paper;

@Service
public class PaperService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<Paper> getAll() {
		// TODO Auto-generated method stub
		List<Paper> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.PaperMapper.selectList");
		return list;
	}

	public void delPaper(String paperId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.PaperMapper.deletePaper",paperId) ;
	}

	public void addPaper(Paper paper) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.PaperMapper.addPaper",paper);
	}

	public void editPaper(Paper paper) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.PaperMapper.editPaper", paper);
	}

	public String getIdByCode(String code) {
		// TODO Auto-generated method stub
		return sessionFactory.openSession().selectOne("cn.sys.manage.entity.PaperMapper.getIdByCode",code);
	}

	public Paper getById(String paperId) {
		// TODO Auto-generated method stub
		List<Paper> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.PaperMapper.getById",paperId);
		System.out.println("size"+list.size());
		return list.get(0) ;
	}
	
}
