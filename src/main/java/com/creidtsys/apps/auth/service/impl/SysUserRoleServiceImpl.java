package com.creidtsys.apps.auth.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.auth.dao.SysUserRoleDao;
import com.creidtsys.apps.auth.entity.SysDept;
import com.creidtsys.apps.auth.entity.SysUserRole;
import com.creidtsys.apps.auth.entity.UserRole;
import com.creidtsys.apps.auth.service.SysUserRoleService;

/**
 * 
* @ClassName: SysUserRoleServiceImpl
* @Description: TODO 用户角色挂关系service实现类
* @author liuyj
* @date 2017年8月26日 上午11:02:54
*
 */
@Service("sysUserRoleService")
public class SysUserRoleServiceImpl implements SysUserRoleService{
	@Autowired
	private SysUserRoleDao userRoleDao ;

	@Override
	public List<SysUserRole> getRoleByUser(String userId) {
		// TODO Auto-generated method stub
		List<SysUserRole> list = userRoleDao.getRoleByUser(userId) ;
		return list;
	}

	@Override
	public void saveUserRole(SysUserRole sysUserRole) {
		// TODO Auto-generated method stub
		String urUserid = sysUserRole.getUrUserId() ;
		String urUserIds = sysUserRole.getRoleIds() ;
		//删除角色用户之间的角色关系
		userRoleDao.delReByUser(urUserid) ;
		if(!"".equals(urUserIds)&&urUserIds!=null){
			//重新维护用户角色之间额关系
			for(String urRoleId : urUserIds.split(",")){
				SysUserRole newSysUserRole = new SysUserRole() ;
				newSysUserRole.setUrRoleId(urRoleId);
				newSysUserRole.setUrUserId(urUserid);
				userRoleDao.addRe(newSysUserRole) ;
			}
		}
		
	}
}	
