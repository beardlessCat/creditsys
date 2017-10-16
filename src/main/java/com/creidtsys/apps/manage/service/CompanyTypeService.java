package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.CompanyType;

@Service
public class CompanyTypeService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<CompanyType> getAll() {
		// TODO Auto-generated method stub
		List<CompanyType> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.CompanyTypeMapper.selectList");
		return list;
	}

	public void addType(CompanyType companyType) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.CompanyTypeMapper.addType",companyType) ;
	}

	public void editType(CompanyType companyType) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.CompanyTypeMapper.editType",companyType) ;
	}

	public void deleteType(String typeId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.CompanyTypeMapper.deleteType",typeId);
	}

	public List<CompanyType> allByCon(String typeName) {
		List<CompanyType> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.CompanyTypeMapper.allByCon", typeName);
		// TODO Auto-generated method stub
		return list;
	}
	
	
}
