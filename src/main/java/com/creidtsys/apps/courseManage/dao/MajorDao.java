package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.Major;

public interface MajorDao {

	List<Major> selectAll(String majorId);

	void deleteMajor(String majorId);

	void addMajor(Major major);

	void editMajor(Major major);

	Major getById(String majorId);

	Major getByName(String majorName);

	List<Major> getidByUserId(String userId);

}
