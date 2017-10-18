package com.creidtsys.apps.courseManage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.UnitDao;
import com.creidtsys.apps.courseManage.entity.Unit;
import com.creidtsys.apps.courseManage.service.UnitService;

@Service("UnitService")
public class UnitServiceImpl implements UnitService{
	@Resource
	private UnitDao unitDao ;

	@Override
	public List<Unit> getAll(String unitName) {
		// TODO Auto-generated method stub
		return unitDao.selectList(unitName);
	}

	@Override
	public void deleteCourse(String unitId) {
		// TODO Auto-generated method stub
		unitDao.delete(unitId);
	}

	@Override
	public void addUnit(Unit unit) {
		// TODO Auto-generated method stub
		unitDao.add(unit) ;
	}

	@Override
	public void editUnit(Unit unit) {
		// TODO Auto-generated method stub
		unitDao.update(unit) ;
	}
}
