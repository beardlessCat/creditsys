package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.Point;


@Service
public class PointService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<Point> getAll(String unitId) {
		// TODO Auto-generated method stub
		List<Point> list= sessionFactory.openSession().selectList("cn.sys.manage.entity.PointMapper.selectList", unitId);
		return list;
	}

	public void deletePoint(String pointId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.PointMapper.delete",pointId);
	}

	public void addCourse(Point point) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.PointMapper.add",point);
	}

	public void editUnit(Point point) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.PointMapper.edit",point) ;
	}
}
