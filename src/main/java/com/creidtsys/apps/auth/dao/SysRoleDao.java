package com.creidtsys.apps.auth.dao;

import java.util.List;
import java.util.Map;

import com.creidtsys.apps.auth.entity.SysRole;

/**
 * 
* @ClassName: SysRoleDao
* @Description: TODO 权限角色dao 
* @author liuyj
* @date 2017年8月26日 上午10:37:05
*
 */

public interface SysRoleDao {
	/**
	 * 
	* @Title: getAllRole 
	* @Description: TODO 查询所有角色 
	* @param roleParentId 上级角色标识
	* @return    
	* @return List<SysRole>    返回类型
	 */
	List<SysRole> getAllRole(String roleParentId);
	/**
	 * 
	* @Title: delRoles 
	* @Description: TODO 根据主键删除角色信息 
	* @param roleId    
	* @return void    返回类型
	 */
	void delRoles(String roleId);
	/**
	 * 
	* @Title: addRole 
	* @Description: TODO 添加角色信息
	* @param sysRole    
	* @return void    返回类型
	 */
	void addRole(SysRole sysRole);
	/**
	 * 
	* @Title: editRole 
	* @Description: TODO 修改角色信息
	* @param sysRole    
	* @return void    返回类型
	 */
	void editRole(SysRole sysRole);
	/**
	 * 
	* @Title: getTreeDate 
	* @Description: TODO 根据id或者pid 查询角色
	* @param para
	* @return    
	* @return List<SysRole>    返回类型
	 */
	List<SysRole> getTreeDate(Map<String, Object> para);
	/**
	 * 
	* @Title: getById 
	* @Description: TODO 根据roleId获取角色信息
	* @param roleId
	* @return    
	* @return SysRole    返回类型
	 */
	SysRole getById(String roleId);

}
