package com.creidtsys.apps.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.CompanyTypeDao;
import com.creidtsys.apps.manage.entity.CompanyType;
import com.creidtsys.apps.manage.service.CompanyTypeService;
@Service("companyTypeService")
public class CompanyTypeServiceImpl implements CompanyTypeService {
	@Resource
	private CompanyTypeDao companyTypeDao ;
	@Override
	public List<CompanyType> getAll() {
		// TODO Auto-generated method stub
		return companyTypeDao.selectList();
	}

	@Override
	public void addType(CompanyType companyType) {
		// TODO Auto-generated method stub
		companyTypeDao.addType(companyType) ;
	}

	@Override
	public void editType(CompanyType companyType) {
		// TODO Auto-generated method stub
		companyTypeDao.editType(companyType) ;
	}

	@Override
	public void deleteType(String typeId) {
		// TODO Auto-generated method stub
		companyTypeDao.deleteType(typeId) ;
	}

	@Override
	public List<CompanyType> allByCon(CompanyType companyType) {
		// TODO Auto-generated method stub
		return companyTypeDao.allByCon(companyType);
	}

}
