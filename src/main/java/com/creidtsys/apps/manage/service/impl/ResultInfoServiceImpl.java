package com.creidtsys.apps.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.ResultInfoDao;
import com.creidtsys.apps.manage.entity.ResultInfo;
import com.creidtsys.apps.manage.service.ResultInfoService;

@Service("resultInfoService")
public class ResultInfoServiceImpl  implements ResultInfoService{
	@Resource
	private ResultInfoDao resultInfoDao ;
	@Override
	public List<ResultInfo> findAll(String riPaperId) {
		// TODO Auto-generated method stub
		return resultInfoDao.selectList(riPaperId);
	}

	@Override
	public void add(ResultInfo resultInfo) {
		// TODO Auto-generated method stub
		resultInfoDao.add(resultInfo) ;
	}

	@Override
	public void editresultInfo(ResultInfo resultInfo) {
		// TODO Auto-generated method stub
		resultInfoDao.edit(resultInfo) ;
	}

	@Override
	public void deleteCompany(String resultId) {
		// TODO Auto-generated method stub
		resultInfoDao.delete(resultId) ;
	}

	@Override
	public Boolean isExist(ResultInfo resultInfo) {
		// TODO Auto-generated method stub
		boolean flag = false ;
		List<ResultInfo> list = resultInfoDao.selectList(resultInfo.getPaperId()) ;
		if(list.size()!=0){
			flag = true ;
		}
		return flag;
	}

	@Override
	public List<ResultInfo> getChoose(ResultInfo resultInfo) {
		// TODO Auto-generated method stub
		return resultInfoDao.getChoosedCourse(resultInfo);
	}

	@Override
	public void editRe(ResultInfo newResultInfo) {
		// TODO Auto-generated method stub
		resultInfoDao.editRe(newResultInfo) ;
	}

}
