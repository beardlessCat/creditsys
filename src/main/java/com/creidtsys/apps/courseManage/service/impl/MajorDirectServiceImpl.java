package com.creidtsys.apps.courseManage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.MajorDirectDao;
import com.creidtsys.apps.courseManage.entity.MajorDirect;
import com.creidtsys.apps.courseManage.service.MajorDirectService;
@Service("majorDirectService")
public class MajorDirectServiceImpl implements MajorDirectService{
	@Resource
	private MajorDirectDao majorDirectDao ;
	
	@Override
	public void add(MajorDirect majorDirect) {
		// TODO Auto-generated method stub
		majorDirectDao.add(majorDirect) ;
	}

	@Override
	public void editType(MajorDirect majorDirect) {
		// TODO Auto-generated method stub
		majorDirectDao.edit(majorDirect) ;
	}

	@Override
	public void deleteType(String majorDirectId) {
		// TODO Auto-generated method stub
		majorDirectDao.delete(majorDirectId) ;
	}

	@Override
	public List<MajorDirect> selectAll(String majorId) {
		// TODO Auto-generated method stub
		return majorDirectDao.selectList(majorId);
	}

}
