package com.creidtsys.apps.auth.service;

import java.util.List;

import com.creidtsys.apps.auth.entity.Role;


public interface RoleService {
	
	List<Role> selectAll();
}
