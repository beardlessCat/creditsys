package com.creidtsys.apps.manage.service;

import java.util.List;

import com.creidtsys.apps.manage.entity.CompanyType;

public interface CompanyTypeService {
	
	public List<CompanyType> getAll() ;

	public void addType(CompanyType companyType) ;

	public void editType(CompanyType companyType) ;

	public void deleteType(String typeId)  ;
	
	public List<CompanyType> allByCon(CompanyType companyType) ;
	
	
}
