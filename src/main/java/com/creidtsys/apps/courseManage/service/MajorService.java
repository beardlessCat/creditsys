package com.creidtsys.apps.courseManage.service;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.Major;


public interface MajorService {
	
	public List<Major> selectAll(String majorId) ;

	public void deleteMajor(String majorId) ;

	public void addMajor(Major major) ;
	public void editMajor(Major major) ;

	public Major getById(String majorId)  ;
	
	public Major getByName(String majorName) ;

	public String getidByUserId(String userId) ;
}
