package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.Point;


public interface PointService {
	
	public List<Point> getAll(String unitId) ;

	public void deletePoint(String pointId) ;

	public void addCourse(Point point) ;
	public void editUnit(Point point)  ;
}
