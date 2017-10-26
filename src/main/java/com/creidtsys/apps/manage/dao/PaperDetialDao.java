package com.creidtsys.apps.manage.dao;

import java.util.List;

import com.creidtsys.apps.manage.entity.PaperDetial;

public interface PaperDetialDao {

	List<PaperDetial> selectList();

	void deleteDetial(String detialId);

	void addDetial(PaperDetial paperDetial);

	void editDetial(PaperDetial paperDetial);

}
