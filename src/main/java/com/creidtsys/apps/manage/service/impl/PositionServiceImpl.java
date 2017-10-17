package com.creidtsys.apps.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.PositionDao;
import com.creidtsys.apps.manage.entity.Position;
import com.creidtsys.apps.manage.service.PositionService;
@Service("positionService")
public class PositionServiceImpl implements PositionService{
	@Resource
	private PositionDao positionDao ;
	@Override
	public List<Position> selectAll(String positionName) {
		// TODO Auto-generated method stub
		
		return positionDao.selectList(positionName);
	}

	@Override
	public void add(Position position) {
		// TODO Auto-generated method stub
		positionDao.addPosition(position) ;
	}

	@Override
	public void edit(Position position) {
		// TODO Auto-generated method stub
		positionDao.editPosition(position) ;
	}

	@Override
	public void deletePosition(String positionId) {
		// TODO Auto-generated method stub
		positionDao.deletePosition(positionId);
	}

}
