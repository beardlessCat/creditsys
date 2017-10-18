package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.Unit;

public interface UnitDao {

	public List<Unit> selectList(String unitName)  ;

	public void delete(String unitId) ;

	public void add(Unit unit) ;

	public void update(Unit unit) ;
}
