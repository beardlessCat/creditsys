package com.creidtsys.apps.auth.service;

import java.util.List;

import com.creidtsys.apps.auth.entity.SysRole;
import com.creidtsys.utils.TreeModel;

/**
 * 
* @ClassName: SysRoleService
* @Description: TODO  权限用户service层
* @author liuyj
* @date 2017年8月26日 上午10:35:56
*
 */
public interface SysRoleService {
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
	* @Title: initRoleTree 
	* @Description: TODO 初始化角色树 
	* @return    
	* @return List<SysRole>    返回类型
	 */
	List<SysRole> initRoleTree();
	/**
	 * 
	* @Title: delRoles 
	* @Description: TODO 删除角色信息
	* @param ids    
	* @return void    返回类型
	 */
	void delRoles(String ids);
	/**
	 * 
	* @Title: saveRole 
	* @Description: TODO 添加角色
	* @param sysRole    
	* @return void    返回类型
	 */
	void saveRole(SysRole sysRole);
	/**
	 * 
	* @Title: updateRole 
	* @Description: TODO  修改角色信息
	* @param sysRole    
	* @return void    返回类型
	 */
	void updateRole(SysRole sysRole);
	/**
	 * 
	* @Title: selectTree 
	* @Description: TODO 获得role树
	* @param id
	* @return    
	* @return TreeModel    返回类型
	 */
	TreeModel selectTree(String id);
	/**
	 * 
	* @Title:  getById 
	* @Description: TODO 根据roleId获取角色信息 
	* @param roleId
	* @return    
	* @return SysRole    返回类型
	 */
	SysRole getById(String roleId);
}
