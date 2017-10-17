package com.creidtsys.apps.manage.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.CompanyDao;
import com.creidtsys.apps.manage.entity.Company;


public interface CompanyService {
	public List<Company> findAll(String companyName) ;

	public void addCompany(Company company) ;

	public void deleteCompany(String companyId)  ;

	public void editCompany(Company company) ;

	public List<Company> selectByCon(Company company) ;
}
