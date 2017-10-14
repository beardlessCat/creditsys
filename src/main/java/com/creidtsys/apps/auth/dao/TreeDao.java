package com.creidtsys.apps.auth.dao;

import java.util.List;
import java.util.Map;

import com.creidtsys.apps.auth.entity.Tree;

public interface TreeDao {

	List<Tree> list(Map<String, Object> para);

}
