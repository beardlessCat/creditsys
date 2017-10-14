package com.creidtsys.apps.auth.service;

import java.util.List;

import com.creidtsys.apps.auth.entity.SysDept;
import com.creidtsys.apps.auth.entity.SysUserRole;

/**
 * 
* @ClassName: SysUserRoleService
* @Description: TODO 用户角色关系service
* @author liuyj
* @date 2017年8月26日 上午11:02:09
*
 */
public interface SysUserRoleService {
	/**
	 * 
	* @Title: getRoleByUser 
	* @Description: TODO 根据用户查询其所属角色 
	* @param userId
	* @return    
	* @return List<SysDept>    返回类型
	 */
	List<SysUserRole> getRoleByUser(String userId);
	/**
	 * 
	* @Title: saveUserRole 
	* @Description: TODO 维护用户与角色之间的关系 
	* @param sysUserRole    
	* @return void    返回类型
	 */
	
	void saveUserRole(SysUserRole sysUserRole);

}
