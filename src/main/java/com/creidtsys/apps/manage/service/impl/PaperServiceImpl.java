package com.creidtsys.apps.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.PaperDao;
import com.creidtsys.apps.manage.entity.Paper;
import com.creidtsys.apps.manage.service.PaperService;
@Service("paperService")
public class PaperServiceImpl implements PaperService{
	@Resource
	private PaperDao paperDao ;
	@Override
	public List<Paper> getAll() {
		// TODO Auto-generated method stub
		return paperDao.selectList();
	}

	@Override
	public void delPaper(String paperId) {
		// TODO Auto-generated method stub
		paperDao.deletePaper(paperId) ;
	}

	@Override
	public void addPaper(Paper paper) {
		// TODO Auto-generated method stub
		paperDao.addPaper(paper) ;
	}

	@Override
	public void editPaper(Paper paper) {
		// TODO Auto-generated method stub
		paperDao.editPaper(paper) ;
	}

	@Override
	public String getIdByCode(String code) {
		// TODO Auto-generated method stub
		return paperDao.getIdByCode(code);
	}

	@Override
	public Paper getById(String paperId) {
		// TODO Auto-generated method stub
		return paperDao.getById( paperId);
	}

}
