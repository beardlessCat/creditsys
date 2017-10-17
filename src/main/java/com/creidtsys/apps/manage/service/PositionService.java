package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.Position;


public interface PositionService {
	
	public List<Position> selectAll(String positionName)  ;
	public void add(Position position) ;
	public void edit(Position position) ;

	public void deletePosition(String positionId)  ;
}
