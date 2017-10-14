package com.creidtsys.apps.auth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.auth.dao.SysUserDao;
import com.creidtsys.apps.auth.entity.SysRes;
import com.creidtsys.apps.auth.entity.SysUser;
import com.creidtsys.apps.auth.service.SysUserService;
/**
 * 
* @ClassName: SysUserServiceImpl
* @Description: TODO 权限用户实现类
* @author liuyj
* @date 2017年8月26日 上午10:34:53 
*
 */
@Service("sysUserService")
public class SysUserServiceImpl implements SysUserService {
	@Autowired
	private SysUserDao userDao ;

	@Override
	public List<SysUser> getAllUser(SysUser sysUser) {
		// TODO Auto-generated method stub
		List<SysUser> list = userDao.getAllUser(sysUser) ;
		return list;
	}

	@Override
	public void saveUser(SysUser sysUser) {
		// TODO Auto-generated method stub
		userDao.addUser(sysUser) ;
	}

	@Override
	public void delUsers(String ids) {
		// TODO Auto-generated method stub
		for(String userId:ids.split(",")){
			userDao.delUser(userId) ;
		}
	}

	@Override
	public void updateDept(SysUser sysUser) {
		// TODO Auto-generated method stub
		userDao.editUser(sysUser);
	}

	@Override
	public SysUser getUserByLoginName(String userName) {
		// TODO Auto-generated method stub
		SysUser sysUser = userDao.getUserByLoginName(userName) ;
		return sysUser;
	}

	
}
