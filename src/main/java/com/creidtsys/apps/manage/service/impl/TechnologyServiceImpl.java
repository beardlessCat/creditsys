package com.creidtsys.apps.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.TechnologyDao;
import com.creidtsys.apps.manage.entity.Technology;
import com.creidtsys.apps.manage.service.TechnologyService;
@Service("technologyService")
public class TechnologyServiceImpl implements TechnologyService {
	@Resource
	private TechnologyDao technologyDao ;
	@Override
	public List<Technology> selectAll(String technologyName) {
		// TODO Auto-generated method stub
		return technologyDao.selectList(technologyName);
	}

	@Override
	public void add(Technology technology) {
		// TODO Auto-generated method stub
		technologyDao.addTechnology(technology) ;
	}

	@Override
	public void edit(Technology technology) {
		// TODO Auto-generated method stub
		technologyDao.editTechnology(technology) ;
	}

	@Override
	public void deleteTechnology(String technologyId) {
		// TODO Auto-generated method stub
		technologyDao.deleteTechnology(technologyId) ;
	}

}
