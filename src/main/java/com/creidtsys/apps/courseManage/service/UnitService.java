package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.Unit;



public interface UnitService {


	public List<Unit> getAll(String unitName) ;

	public void deleteCourse(String unitId)  ;
	public void addUnit(Unit unit) ;

	public void editUnit(Unit unit) ;
}
