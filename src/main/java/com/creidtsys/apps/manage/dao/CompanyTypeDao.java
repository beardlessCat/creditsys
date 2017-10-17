package com.creidtsys.apps.manage.dao;

import java.util.List;

import com.creidtsys.apps.manage.entity.CompanyType;

public interface CompanyTypeDao {

	List<CompanyType> selectList();

	void addType(CompanyType companyType);

	void editType(CompanyType companyType);

	void deleteType(String typeId);

	List<CompanyType> allByCon(CompanyType companyType);

}
