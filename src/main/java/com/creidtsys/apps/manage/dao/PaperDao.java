package com.creidtsys.apps.manage.dao;

import java.util.List;

import com.creidtsys.apps.manage.entity.Paper;

public interface PaperDao {

	List<Paper> selectList();

	void deletePaper(String paperId);

	void addPaper(Paper paper);

	void editPaper(Paper paper);

	String getIdByCode(String code);

	Paper getById(String paperId);

}
