package com.creidtsys.apps.manage.dao;

import java.util.List;

import com.creidtsys.apps.manage.entity.Technology;

public interface TechnologyDao {

	List<Technology> selectList(String technologyName);

	void addTechnology(Technology technology);

	void editTechnology(Technology technology);

	void deleteTechnology(String technologyId);

}
