package com.creidtsys.apps.courseManage.service;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.CultivateScheme;


public interface CultivateSchemeService {
	
	
	public List<CultivateScheme> selectAll(String majorId)  ;

	public void deleteCultivate(String cultivateId) ;
	
	public void addCultivate(CultivateScheme cultivateScheme) ;
	public void editCultivate(CultivateScheme cultivateScheme) ;

	public CultivateScheme getById(String cultivateId)  ;
	
	public CultivateScheme getByMajorId(String majorId) ;
	
}
