package com.creidtsys.apps.manage.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.entity.Paper;


public interface PaperService {

	public List<Paper> getAll();

	public void delPaper(String paperId)  ;

	public void addPaper(Paper paper) ;

	public void editPaper(Paper paper);

	public String getIdByCode(String code) ;

	public Paper getById(String paperId) ;
	
}
