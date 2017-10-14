package com.creidtsys.apps.auth.dao;

import java.util.List;

import com.creidtsys.apps.auth.entity.SysRoleRes;

/**
 * 
* @ClassName: SysRoleResDao
* @Description: TODO 权限角色资源dao
* @author liuyj
* @date 2017年8月26日 上午10:49:26
*
 */
public interface SysRoleResDao {
	/**
	 * 
	* @Title: addRoleRes 
	* @Description: TODO 添加权限角色之间的关系
	* @param sysRoleRes    
	* @return void    返回类型
	 */
	void addRoleRes(SysRoleRes sysRoleRes);
	/**
	 * 
	* @Title: getResByRole 
	* @Description: TODO 根据角色获取权限
	* @param roleId
	* @return    
	* @return List<SysRoleRes>    返回类型
	 */
	List<SysRoleRes> getResByRole(String roleId);
	/**
	 * 
	* @Title: delResByRole 
	* @Description: TODO 根据角色删除关系
	* @param roleId    
	* @return void    返回类型
	 */
	void delResByRole(String roleId);
	/**
	 * 
	* @Title: addRes 
	* @Description: TODO 添加角色与资源之间的关系 
	* @param userRes    
	* @return void    返回类型
	 */
	void addRes(SysRoleRes userRes);

}
