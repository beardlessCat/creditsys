package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.Point;

public interface PointDao {

	List<Point> selectList(String unitId);

	void delete(String pointId);

	void add(Point point);

	void eit(Point point);

}
