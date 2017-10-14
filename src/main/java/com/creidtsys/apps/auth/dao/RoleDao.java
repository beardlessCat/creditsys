package com.creidtsys.apps.auth.dao;

import java.util.List;

import com.creidtsys.apps.auth.entity.Role;

public interface RoleDao {
	
	List<Role> selectAll();
}
