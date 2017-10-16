package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.ResultInfo;

@Service
public class ResultInfoService {
	@Autowired
	private SqlSessionFactory sessionFactory ;

	public List<ResultInfo> findAll(String riPaperId) {
		// TODO Auto-generated method stub
		List<ResultInfo> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.ResultInfoMapper.selectList", riPaperId) ;
		return list;
	}

	public void add(ResultInfo resultInfo) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().insert("cn.sys.manage.entity.ResultInfoMapper.add", resultInfo);
	}

	public void editresultInfo(ResultInfo resultInfo) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.ResultInfoMapper.edit", resultInfo);
	}

	public void deleteCompany(String resultId) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().delete("cn.sys.manage.entity.ResultInfoMapper.delete", resultId); 
	}

	public Boolean isExist(ResultInfo resultInfo) {
		// TODO Auto-generated method stub
		boolean flag = false ;
		List<ResultInfo> list = sessionFactory.openSession().selectList("cn.sys.manage.entity.ResultInfoMapper.isExist",resultInfo) ;
		if(list.size()!=0){
			flag = true ;
		}
		return flag;
	}

	public List<ResultInfo> getChoose(ResultInfo resultInfo) {
		List<ResultInfo>  list = sessionFactory.openSession().selectList("cn.sys.manage.entity.ResultInfoMapper.getChoosedCourse",resultInfo) ;
		// TODO Auto-generated method stub
		return list;
	}

	public void editRe(ResultInfo newResultInfo) {
		// TODO Auto-generated method stub
		sessionFactory.openSession().update("cn.sys.manage.entity.ResultInfoMapper.editRe", newResultInfo);
	}
}
