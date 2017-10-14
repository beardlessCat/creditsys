package com.creidtsys.apps.auth.dao;

import java.util.List;

import com.creidtsys.apps.auth.entity.SysUserRole;

/**
 * 
* @ClassName: SysUserRoleDao
* @Description: TODO 用户角色关系dao
* @author liuyj
* @date 2017年8月26日 上午11:01:08
*
 */
public interface SysUserRoleDao {
	/**
	 * 
	* @Title: getRoleByUser 
	* @Description: TODO 根据其用户查询职位
	* @return    
	* @return List<SysUserRole>    返回类型
	 */
	List<SysUserRole> getRoleByUser(String userId);
	/**
	 * 
	* @Title: delReByUser 
	* @Description: TODO 根据用户删除其与角色之间的关系
	* @param urUserid    
	* @return void    返回类型
	 */
	void delReByUser(String urUserid);
	/**
	 * 
	* @Title: addRe 
	* @Description: TODO 保存用户与角色之间的关系
	* @param newSysUserRole    
	* @return void    返回类型
	 */
	void addRe(SysUserRole newSysUserRole);

}
