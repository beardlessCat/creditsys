package com.creidtsys.apps.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.manage.dao.PaperDetialDao;
import com.creidtsys.apps.manage.entity.PaperDetial;
import com.creidtsys.apps.manage.service.PaperDetialService;
@Service("paperDetialService")
public class PaperDetialSeviceImpl implements PaperDetialService{
	@Resource
	private PaperDetialDao paperDetialDao ;
	@Override
	public List<PaperDetial> findAll() {
		// TODO Auto-generated method stub
		return paperDetialDao.selectList();
	}

	@Override
	public void deleteDetial(String detialId) {
		// TODO Auto-generated method stub
		paperDetialDao.deleteDetial(detialId) ;
	}

	@Override
	public void add(PaperDetial paperDetial) {
		// TODO Auto-generated method stub
		paperDetialDao.addDetial(paperDetial) ;
	}

	@Override
	public void editCompany(PaperDetial paperDetial) {
		// TODO Auto-generated method stub
		paperDetialDao.editDetial(paperDetial) ;
	}

}
