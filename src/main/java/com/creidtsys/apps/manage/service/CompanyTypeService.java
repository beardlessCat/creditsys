package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.CompanyType;

public interface CompanyTypeService {
	
	public List<CompanyType> getAll() ;

	public void addType(CompanyType companyType) ;

	public void editType(CompanyType companyType) ;

	public void deleteType(String typeId)  ;
	
	public List<CompanyType> allByCon(CompanyType companyType) ;
	
	
}
