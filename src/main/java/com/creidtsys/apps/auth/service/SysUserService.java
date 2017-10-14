package com.creidtsys.apps.auth.service;

import java.util.List;

import com.creidtsys.apps.auth.entity.SysRes;
import com.creidtsys.apps.auth.entity.SysUser;


/**
 * 
* @ClassName: SysUserService
* @Description: TODO 权限用户service层
* @author liuyj
* @date 2017年8月26日 上午10:24:43
*
 */
public interface SysUserService {
	/**
	 * 
	* @Title: getAllUser 
	* @Description: TODO 查新用户（根据部门标识，条件可为空）
	* @param sysUser
	* @return    
	* @return List<SysUser>    返回类型
	 */
	List<SysUser> getAllUser(SysUser sysUser);
	/**
	 * 
	* @Title: saveUser 
	* @Description: TODO 添加用户
	* @param sysUser    
	* @return void    返回类型
	 */
	void saveUser(SysUser sysUser);
	/**
	 * 
	* @Title: delUsers 
	* @Description: TODO 批量删除用户
	* @param ids    
	* @return void    返回类型
	 */
	void delUsers(String ids);
	/**
	 * 
	* @Title: updateDept 
	* @Description: TODO 修改用户信息
	* @param sysUser    
	* @return void    返回类型
	 */
	void updateDept(SysUser sysUser);
	/**
	 * 
	* @Title: getUserByLoginName 
	* @Description: TODO 根据登录名获取用户信息
	* @param username
	* @return    
	* @return SysUser    返回类型
	 */
	SysUser getUserByLoginName(String userName);
}

