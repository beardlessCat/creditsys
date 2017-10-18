package com.creidtsys.apps.courseManage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.PointDao;
import com.creidtsys.apps.courseManage.entity.Point;
import com.creidtsys.apps.courseManage.service.PointService;

@Service("pointService")
public class PointServiceImpl implements PointService{
	@Resource
	private PointDao pointDao ;

	@Override
	public List<Point> getAll(String unitId) {
		// TODO Auto-generated method stub
		return pointDao.selectList(unitId);
	}

	@Override
	public void deletePoint(String pointId) {
		// TODO Auto-generated method stub
		pointDao.delete(pointId) ;
	}

	@Override
	public void addCourse(Point point) {
		// TODO Auto-generated method stub
		pointDao.add(point) ;
	}

	@Override
	public void editUnit(Point point) {
		// TODO Auto-generated method stub
		pointDao.eit(point) ;
	}
}
