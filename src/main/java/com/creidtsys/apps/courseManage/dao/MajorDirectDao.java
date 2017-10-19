package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.MajorDirect;

public interface MajorDirectDao {

	void add(MajorDirect majorDirect);

	void edit(MajorDirect majorDirect);

	void delete(String majorDirectId);

	List<MajorDirect> selectList(String majorId);

}
