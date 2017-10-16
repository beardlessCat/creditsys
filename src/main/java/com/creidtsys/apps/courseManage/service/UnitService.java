package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.Unit;


@Service
public class UnitService {
	@Autowired
	private SqlSessionFactory sqlSessionFactory ;

	public List<Unit> getAll(String unitName) {
		// TODO Auto-generated method stub
		List<Unit> list= sqlSessionFactory.openSession().selectList("cn.sys.manage.entity.UnitMapper.selectList",unitName);
		return list;
	}

	public void deleteCourse(String unitId) {
		// TODO Auto-generated method stub
		sqlSessionFactory.openSession().delete("cn.sys.manage.entity.UnitMapper.delete", unitId);
	}

	public void addUnit(Unit unit) {
		// TODO Auto-generated method stub
		sqlSessionFactory.openSession().insert("cn.sys.manage.entity.UnitMapper.add",unit);
	}

	public void editUnit(Unit unit) {
		// TODO Auto-generated method stub
		sqlSessionFactory.openSession().update("cn.sys.manage.entity.UnitMapper.update",unit) ;
	}
}
