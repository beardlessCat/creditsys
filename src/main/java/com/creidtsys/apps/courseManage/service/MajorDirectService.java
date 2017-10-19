package com.creidtsys.apps.courseManage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.entity.MajorDirect;

@Service
public interface MajorDirectService {


	public List<MajorDirect> selectAll(String majorId)  ;

	public void add(MajorDirect majorDirect) ;

	public void editType(MajorDirect majorDirect) ;

	public void deleteType(String majorDirectId) ;
}
