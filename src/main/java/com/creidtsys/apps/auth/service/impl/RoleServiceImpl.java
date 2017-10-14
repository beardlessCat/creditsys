package com.creidtsys.apps.auth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.auth.dao.RoleDao;
import com.creidtsys.apps.auth.entity.Role;
import com.creidtsys.apps.auth.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao userDao;

	@Override
	public List<Role> selectAll() {

		return userDao.selectAll();
	}

}
