package com.creidtsys.apps.manage.dao;

import java.util.List;

import com.creidtsys.apps.manage.entity.ResultInfo;

public interface ResultInfoDao {

	List<ResultInfo> selectList(String riPaperId);

	void add(ResultInfo resultInfo);

	void edit(ResultInfo resultInfo);

	void delete(String resultId);

	List<ResultInfo> selectList(ResultInfo resultInfo);

	List<ResultInfo> getChoosedCourse(ResultInfo resultInfo);

	void editRe(ResultInfo newResultInfo);

}
