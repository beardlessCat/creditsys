package com.creidtsys.apps.manage.service;

import java.util.List;

import com.creidtsys.apps.manage.entity.PaperDetial;


public interface PaperDetialService {

	public List<PaperDetial> findAll() ;
	public void deleteDetial(String detialId) ;
	public void add(PaperDetial paperDetial) ;
	public void editCompany(PaperDetial paperDetial) ;
}
