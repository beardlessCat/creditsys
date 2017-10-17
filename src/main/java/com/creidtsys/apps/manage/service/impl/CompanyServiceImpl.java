package com.creidtsys.apps.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.CompanyDao;
import com.creidtsys.apps.manage.entity.Company;
import com.creidtsys.apps.manage.service.CompanyService;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService{
	@Resource
	private CompanyDao companyDao ;
	@Override
	public List<Company> findAll(String companyName) {
		// TODO Auto-generated method stub
		return companyDao.findAll( companyName) ;
	}

	@Override
	public void addCompany(Company company) {
		// TODO Auto-generated method stub
		companyDao.addCompany(company) ;
	}

	@Override
	public void deleteCompany(String companyId) {
		// TODO Auto-generated method stub
		companyDao.deleteCompany(companyId) ;
	}

	@Override
	public void editCompany(Company company) {
		// TODO Auto-generated method stub
		companyDao.editCompany(company) ;
	}

	@Override
	public List<Company> selectByCon(Company company) {
		// TODO Auto-generated method stub
		return companyDao.selectByCon(company);
	}

}
