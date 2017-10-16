package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.Company;

@Service
public class CompanyService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<Company> findAll(String companyName) {
		// TODO Auto-generated method stub
		List<Company> lsit = sessionFactory.openSession().selectList("cn.sys.manage.entity.CompanyMapper.selectList", companyName) ;
		return lsit;
	}

	public void add(Company company) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.CompanyMapper.addCompany", company);
	}

	public void deleteCompany(String companyId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.CompanyMapper.deleteCompany",companyId) ;
	}

	public void editCompany(Company company) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.CompanyMapper.editCompany",company);
	}

	public List<Company> selectByCon(Company company) {
		List<Company> lsit = sessionFactory.openSession().selectList("cn.sys.manage.entity.CompanyMapper.selectByCon", company) ;
		return lsit;
	}
}
