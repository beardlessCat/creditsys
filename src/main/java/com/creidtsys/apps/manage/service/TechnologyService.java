package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.Technology;

public interface TechnologyService {
	

	public List<Technology> selectAll(String technologyName) ;

	public void add(Technology technology) ;

	public void edit(Technology technology) ;

	public void deleteTechnology(String technologyId) ;
	
}
