package com.creidtsys.apps.manage.service;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.HTMLInfo;
import com.creidtsys.apps.manage.entity.ResultInfo;

public interface ResultInfoService {

	public List<ResultInfo> findAll(String riPaperId) ; 

	public void add(ResultInfo resultInfo) ;

	public void editresultInfo(ResultInfo resultInfo) ;
	public void deleteCompany(String resultId) ;

	public Boolean isExist(ResultInfo resultInfo)  ;

	public List<ResultInfo> getChoose(ResultInfo resultInfo) ;

	public void editRe(ResultInfo newResultInfo) 	 ;

}
