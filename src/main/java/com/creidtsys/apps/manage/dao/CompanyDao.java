package com.creidtsys.apps.manage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.creidtsys.apps.manage.entity.Company;
@Repository
public interface CompanyDao {

	List<Company> findAll(String companyName);

	void addCompany(Company company);

	void deleteCompany(String companyId);

	void editCompany(Company company);

	List<Company> selectByCon(Company company);
	
}
