package com.creidtsys.apps.courseManage.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.creidtsys.apps.courseManage.dao.MajorDao;
import com.creidtsys.apps.courseManage.entity.Major;
import com.creidtsys.apps.courseManage.service.MajorService;

@Service("majorService")
public class MajorServiceImpl implements MajorService{
	@Resource
	private MajorDao majorDao ;

	@Override
	public List<Major> selectAll(String majorId) {
		// TODO Auto-generated method stub
		return majorDao.selectAll(majorId);
	}

	@Override
	public void deleteMajor(String majorId) {
		// TODO Auto-generated method stub
		majorDao.deleteMajor(majorId) ;
	}

	@Override
	public void addMajor(Major major) {
		// TODO Auto-generated method stub
		majorDao.addMajor(major) ;
	}

	@Override
	public void editMajor(Major major) {
		// TODO Auto-generated method stub
		majorDao.editMajor(major) ;
	}

	@Override
	public Major getById(String majorId) {
		// TODO Auto-generated method stub
		return majorDao.getById(majorId);
	}

	@Override
	public Major getByName(String majorName) {
		// TODO Auto-generated method stub
		return majorDao.getByName(majorName);
	}

	@Override
	public String getidByUserId(String userId) {
		// TODO Auto-generated method stub
		return majorDao.getidByUserId(userId).get(0).getMajorId();
	}
}
