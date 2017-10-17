package com.creidtsys.apps.manage.dao;

import java.util.List;

import com.creidtsys.apps.manage.entity.Position;

public interface PositionDao {

	List<Position> selectList(String positionName);

	void addPosition(Position position);

	void editPosition(Position position);

	void deletePosition(String positionId);

}
