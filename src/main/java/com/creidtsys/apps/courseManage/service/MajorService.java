package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.Major;


@Service
public class MajorService {
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	public List<Major> selectAll(String majorId) {
		// TODO Auto-generated method stub
		List<Major> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.MajorMapper.selectAll",majorId);
		return list ;
	}

	public void deleteMajor(String majorId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.MajorMapper.deleteMajor",majorId) ;
 	}

	public void addMajor(Major major) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.MajorMapper.addMajor", major) ;
	}

	public void editMajor(Major major) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.MajorMapper.editMajor", major);
	}

	public Major getById(String majorId) {
		// TODO Auto-generated method stub
		Major major =sessionFactory.openSession().selectOne("cn.sys.manage.entity.MajorMapper.getById",majorId);
		return major;
	}
	
	public Major getByName(String majorName)
	{
		Major major = sessionFactory.openSession().selectOne("cn.sys.manage.entity.MajorMapper.getByName", majorName);
	    return major;
	}

	public String getidByUserId(String userId) {
		// TODO Auto-generated method stub
		List<Major> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.MajorMapper.getidByUserId",userId);
		if(list.size()==0){
			return "";
		}
		return list.get(0).getMajorId();
	}
}
