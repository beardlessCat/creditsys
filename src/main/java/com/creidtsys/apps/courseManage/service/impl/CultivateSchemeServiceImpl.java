package com.creidtsys.apps.courseManage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.creidtsys.apps.courseManage.dao.CultivateSchemeDao;
import com.creidtsys.apps.courseManage.entity.CultivateScheme;
import com.creidtsys.apps.courseManage.service.CultivateSchemeService;
@Service("cultivateSchemeService")
public class CultivateSchemeServiceImpl implements CultivateSchemeService {
	@Resource
	private CultivateSchemeDao   cultivateSchemeDao ;
	@Override
	public List<CultivateScheme> selectAll(String majorId) {
		// TODO Auto-generated method stub
		return cultivateSchemeDao.selectAll(majorId);
	}

	@Override
	public void deleteCultivate(String cultivateId) {
		// TODO Auto-generated method stub
		cultivateSchemeDao.deleteCultivate(cultivateId) ;
	}

	@Override
	public void addCultivate(CultivateScheme cultivateScheme) {
		// TODO Auto-generated method stub
		cultivateSchemeDao.addCultivate(cultivateScheme) ;
	}

	@Override
	public void editCultivate(CultivateScheme cultivateScheme) {
		// TODO Auto-generated method stub
		cultivateSchemeDao.editCultivate(cultivateScheme) ;
	}

	@Override
	public CultivateScheme getById(String cultivateId) {
		// TODO Auto-generated method stub
		return cultivateSchemeDao.getById(cultivateId);
	}

	@Override
	public CultivateScheme getByMajorId(String majorId) {
		// TODO Auto-generated method stub
		return cultivateSchemeDao.getByMajorId(majorId);
	}

}
