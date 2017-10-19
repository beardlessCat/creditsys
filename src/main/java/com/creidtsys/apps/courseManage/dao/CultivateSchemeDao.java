package com.creidtsys.apps.courseManage.dao;

import java.util.List;

import com.creidtsys.apps.courseManage.entity.CultivateScheme;

public interface CultivateSchemeDao {

	List<CultivateScheme> selectAll(String majorId);

	void deleteCultivate(String cultivateId);

	void addCultivate(CultivateScheme cultivateScheme);

	void editCultivate(CultivateScheme cultivateScheme);

	CultivateScheme getById(String cultivateId);

	CultivateScheme getByMajorId(String majorId);

}
