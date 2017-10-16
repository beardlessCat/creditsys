package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.Position;

@Service
public class PositionService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<Position> selectAll(String positionName) {
		// TODO Auto-generated method stub
		List<Position> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.PositionMapper.selectList",positionName);
		return list;
	}

	public void add(Position position) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.PositionMapper.addPosition",position);
	}

	public void edit(Position position) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.PositionMapper.editPosition",position) ;
	}

	public void deletePosition(String positionId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.PositionMapper.deletePosition",positionId);
	}
}
