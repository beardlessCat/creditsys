package com.creidtsys.apps.auth.dao;

import java.util.List;

import com.creidtsys.apps.auth.entity.SysUser;

/**
 * 
* @ClassName: SysUserDao
* @Description: TODO 权限用户dao层
* @author liuyj
* @date 2017年8月26日 上午10:23:57
*
 */
public interface SysUserDao {
	/**
	 * 
	* @Title: getAllUser 
	* @Description: TODO 查询全部用户（根据所属角色）
	* @return    
	* @return List<SysUser>    返回类型
	 */
	List<SysUser> getAllUser(SysUser sysUser);
	/**
	 * 
	* @Title: addUser 
	* @Description: TODO 添加用户
	* @param sysUser    
	* @return void    返回类型
	 */
	void addUser(SysUser sysUser);
	/**
	 * 
	* @Title: delUser 
	* @Description: TODO 删除用户信息
	* @param userId    
	* @return void    返回类型
	 */
	void delUser(String userId);
	/**
	 * 
	* @Title: editUser 
	* @Description: TODO 修改用户信息
	* @param sysUser    
	* @return void    返回类型
	 */
	void editUser(SysUser sysUser);
	/**
	 * 
	* @Title: getUserByLoginName 
	* @Description: TODO  根据登录名获取用户信息
	* @param userName
	* @return    
	* @return SysUser    返回类型
	 */
	SysUser getUserByLoginName(String userName);

}
